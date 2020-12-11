class MeasuresChannel < ApplicationCable::Channel
  def subscribed
    stream_from "measures_channel"
  end

  def unsubscribed
    stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end
end
