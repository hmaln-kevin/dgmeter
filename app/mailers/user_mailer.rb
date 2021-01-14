class UserMailer < ApplicationMailer
    def disconnected_device
        @device = params[:device]
        @users = @device.unit.users
        # wait for 60s and send a message in case the device is still disconnected
        sleep 90
        if @device.connection == false
            @users.each do |user|
                @name = user.name
                mail(to: user.email, subject: 'Disconnected Device')
            end
        end
    end
end
