class PingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Sock::Client.new.pub({ title: 'ping', body: 'pong'}.to_json, channel: 'my-channel')
  end
end
