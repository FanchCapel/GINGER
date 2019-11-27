class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content, :send_at, :message_type_id, :experience_id)
  end

end
