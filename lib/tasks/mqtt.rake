require 'mqtt'

namespace :mqtt do
  desc "Listen to broker MQTT and save incoming data"
  task listen: :environment do
    begin
      loop do
        puts "Waiting the next payload..."
        MQTT::Client.connect(:host => 'broker.hivemq.com', :keep_alive => 60) do |client|
          puts "1"
          client.get('topico_le_medida') do |topic, message| # return the topic and the payload Ex. => ("topico_le_medida", "223.60,0.18,39.50,0.52,60.00,0.99")
  
            aux = message.lines(',', chomp: true) # transform the payload in a array with data Ex. => "223.60", "0.18", "39.50", "0.52", "60.00", "0.99", "device_id", "Date"        
            Measure.create! voltage: aux[0], current: aux[1], power: aux[2], energy: aux[3], frequency: aux[4], pf: aux[5], created_at: aux[7], device_id: aux[6], date: Time.now
            puts "New data stored"
            # device_id need to be the same send by ESP32
            # for example if you create a device here you need to informe to ESP32 what is your id to it identify itself
          end
        end     
      end
    rescue => e
      puts e.message
      sleep(2)
      retry
    end  

  end

end
