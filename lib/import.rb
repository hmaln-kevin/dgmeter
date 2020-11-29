require 'rubygems'
require 'mqtt'

module ImportValue

    def self.voltage

        MQTT::Client.connect('mqtt.eclipse.org') do |client|
            # If you pass a block to the get method, then it will loop
            client.get('topico_le_tensao') do |topic,message|
                return message
            end
        end

    end

    def self.current

        MQTT::Client.connect('mqtt.eclipse.org') do |client|
            # If you pass a block to the get method, then it will loop
            client.get('topico_le_corrente') do |topic,message|
                return message
            end
        end

    end

    def self.power

        MQTT::Client.connect('mqtt.eclipse.org') do |client|
            # If you pass a block to the get method, then it will loop
            client.get('topico_le_potencia') do |topic,message|
                return message
            end
        end

    end

    def self.energy

        MQTT::Client.connect('mqtt.eclipse.org') do |client|
            # If you pass a block to the get method, then it will loop
            client.get('topico_le_energia') do |topic,message|
                return message
            end
        end

    end

    def self.frequency

        MQTT::Client.connect('mqtt.eclipse.org') do |client|
            # If you pass a block to the get method, then it will loop
            client.get('topico_le_frequencia') do |topic,message|
                return message
            end
        end

    end

    def self.pf

        MQTT::Client.connect('mqtt.eclipse.org') do |client|
            # If you pass a block to the get method, then it will loop
            client.get('topico_le_fp') do |topic,message|
                return message
            end
        end

    end

    def self.measure

        MQTT::Client.connect('mqtt.eclipse.org') do |client|
            message = client.get('topico_le_medida')
            return message
        end

    end

end