class MessagesController < ApplicationController



  def create

    @message = Message.new(message_params)
    case @message.experience.date
      when Date.today - 1
        client = Nexmo::Client.new(api_key: ENV['NEXMO_API_KEY'], api_secret: ENV['NEXMO_API_SECRET'])
        client.sms.send(
          from: "Votre Majordome Ginger",
          to: "41795360618",
          text: "Hello from Nexmo"
        )
        @message.send_at = Time.now
        @message.save
      when Date.today && Time.now.hour == 15
        client = Nexmo::Client.new(api_key: ENV['NEXMO_API_KEY'], api_secret: ENV['NEXMO_API_SECRET'])
        client.sms.send(
          from: "Votre Majordome Ginger",
          to: "41795360618",
          text: "Hello from Nexmo"
        )
        @message.send_at = Time.now
        @message.save
      when Date.today && Time.now.hour == 18 && Time.now.min == 30
        client = Nexmo::Client.new(api_key: ENV['NEXMO_API_KEY'], api_secret: ENV['NEXMO_API_SECRET'])
        client.sms.send(
          from: "Votre Majordome Ginger",
          to: "41795360618",
          text: "Hello from Nexmo"
        )
        @message.send_at = Time.now
        @message.save
      end


    end

  private

  def message_params
    params.require(:message).permit(:user_id, :content, :send_at, :message_type_id, :experience_id
  end

end
