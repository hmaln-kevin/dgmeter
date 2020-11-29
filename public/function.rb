require 'mqtt'

MQTT::Client.connect('mqtt.eclipse.org') do |client|
    # If you pass a block to the get method, then it will loop
    measure = Array.new

    measure = client.get('topico_le_medida') # return the topic and the payload Ex. => ("topico_le_medida", "223.60,0.18,39.50,0.52,60.00,0.99")
    measure = measure[1].lines(',', chomp: true) # transform the payload in a array with data Ex. => "223.60", "0.18", "39.50", "0.52", "60.00", "0.99"

    measure.each do |i|
        puts i
    end
    
end