require 'mqtt'

class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(load)
    MQTT::Client.connect('broker.hivemq.com') do |c|
      c.publish(load.load_topic.description, load.state ? "1" : "0")
    end
  end
end
