class MessageJob < ApplicationJob
  queue_as :default
  def perform
    client = Nexmo::Client.new(api_key: ENV['NEXMO_API_KEY'], api_secret: ENV['NEXMO_API_SECRET'])
    client.sms.send(
      from: "Votre Majordome Ginger",
      to: "41795360618",
      text: "Hello from Nexmo"
      )
  end
end
