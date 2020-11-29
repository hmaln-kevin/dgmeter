require 'mqtt'

Thread.new do

  Rails.application.reloader.wrap do

    loop do

      MQTT::Client.connect(:host => 'broker.hivemq.com', :keep_alive => 60) do |client|

         
        client.get('kcpn_keep_alive') do |topic, message| 

          arg = message.lines(',', chomp: true)
          
          @device = Device.find(arg[1]) # Couldn't find Device without an ID (ActiveRecord::RecordNotFound) ?
          
          if @device.connection != arg[0] # it's not working because arg[0] it a string, maybe.
            @device.update! connection: arg[0]
            sleep 5
            if @device.connection == false
              # sends an email to all associated users device
              UserMailer.with(device: @device).disconnected_device.deliver_later
            end
            # Send an array with device_id and connection to update front-end device status
            ActionCable.server.broadcast 'room_channel', message: [@device.id, @device.connection]
          end
        end
      end               
    end   
  end
end
