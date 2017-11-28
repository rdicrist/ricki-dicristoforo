class MessageMailer < ActionMailer  #::Base
    default from: "Your Mailer <noreply@rickidicristoforo.com>"
    default to: "Ricki DiCristoforo <edicristoforo@gmail.com>"
    
    def new_message(message)
        @message = message
        
        mail subject: "Message from #{message.name}"
    end
end
