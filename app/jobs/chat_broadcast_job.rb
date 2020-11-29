class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(measure)
    power_properties = Measure.pluck(:created_at, :energy)
    ActionCable.server.broadcast 'room_channel', message: measure
    # energy_properties = Measure.pluck(:created_at, :energy)
    
    # redirect_to index_action_path(passed_parameter: @power_properties)
  end
  
  private
  def render_measure()
    ApplicationController.renderer.render(partial: 'measures/charts')
  end
end
