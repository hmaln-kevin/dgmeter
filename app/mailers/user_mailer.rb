class UserMailer < ApplicationMailer
    def disconnected_device
        @device = params[:device]
        @users = @device.unit.users
        @users.each do |user|
            @name = user.name
            mail(to: user.email, subject: 'Disconnected Device')
        end
    end
end
