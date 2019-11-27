Sidekiq.configure_server do |config|
  config.average_scheduled_poll_interval = 900 #check every 900 sec if there is any job in the queue
end
