class MessagesController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if @message.valid?
      MessageMailer.new_message(@message).deliver
      redirect_to contact_path, notice: "Your messages has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end
  
  def protect_against_forgery?
      false
  end
  
# def create
#     @message = Message.new(params[:message])
#     # @message.request = request
#     if @message.deliver
#       flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
#     else
#       flash.now[:error] = 'Cannot send message.'
#       render :new
#     end
# end
  
private

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
  


end
