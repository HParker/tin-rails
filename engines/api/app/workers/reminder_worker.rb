class ReminderWorker
  include Sidekiq::Worker
  def perform(message)
    Sock::Client.new.pub({ title: "Reminder!", body: message }.to_json, channel: 'my-channel')
  end
end
