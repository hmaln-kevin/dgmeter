require 'mqtt'

        MQTT::Client.connect('mqtt.eclipse.org') do |client|
                
            client.get('kcpn_keep_alive') do |topic, message| # return the topic and the payload Ex. => ("topico_le_medida", "223.60,0.18,39.50,0.52,60.00,0.99")

                aux = message.lines(',', chomp: true) # transform the payload in a array with data Ex. => "223.60", "0.18", "39.50", "0.52", "60.00", "0.99", "device_id"          
                puts aux[1]
            end
    
        end  