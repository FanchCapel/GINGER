class MessagesController < ApplicationController

  def create
    MessageJob.set(wait_until: Date.tomorrow.noon).perform_later(message_id)
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content, :send_at, :message_type_id, :experience_id)
  end

end
