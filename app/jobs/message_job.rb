class MessageJob < ApplicationJob
  queue_as :default

  def perform(message_id)
    message = Message.find(message_id)
    user = message.experience.user
    user.primary_number[0] = ''
    user.secondary_number[0] = ''
    client = Nexmo::Client.new(api_key: ENV['NEXMO_API_KEY'], api_secret: ENV['NEXMO_API_SECRET'])
    client.sms.send(
      from: "Votre Majordome Ginger",
      to: "41#{user.primary_number}",
      text: "#{message_type.content}"
      )
  end
end
