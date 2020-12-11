require 'mqtt'

Thread.new do

    Rails.application.reloader.wrap do 
        begin
            loop do

                MQTT::Client.connect(:host => 'broker.hivemq.com', :keep_alive => 60) do |client|
                    
                    client.get('topico_le_medida') do |topic, message| # return the topic and the payload Ex. => ("topico_le_medida", "223.60,0.18,39.50,0.52,60.00,0.99")
    
                        aux = message.lines(',', chomp: true) # transform the payload in a array with data Ex. => "223.60", "0.18", "39.50", "0.52", "60.00", "0.99", "device_id", "Date"          
                        Measure.create! voltage: aux[0], current: aux[1], power: aux[2], energy: aux[3], frequency: aux[4], pf: aux[5], created_at: aux[7], device_id: aux[6], date: Time.now
                        # device_id need to be the same send by ESP32
                        # for example if you create a device here you need to informe to ESP32 what is your id to it identify itself
                        nowEnergy = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', DateTime.now.beginning_of_day+30.second, DateTime.now.end_of_day+30.second, aux[6]).sum(:energy)
                        maxDemand = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day, aux[6]).maximum(:power)
                        ActionCable.server.broadcast 'measures_channel', message: [aux[6], nowEnergy, maxDemand, aux[0], aux[4]]
                    end
            
                end     
                     
            end 
        rescue => exception # rescue all exceptions that inherit from StandardError and reset the application
            puts exception.message
            sleep(2)
            retry
        rescue MQTT::ProtocolException => exception # rescue all ProtocolExceptions and reset the application (execute loop do again)
            puts exception.message
            sleep(2)
            retry
        end
   
    end
end