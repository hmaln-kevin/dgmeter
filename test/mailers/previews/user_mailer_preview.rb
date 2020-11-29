# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def disconnected_device
        UserMailer.disconnected_device
    end
end
