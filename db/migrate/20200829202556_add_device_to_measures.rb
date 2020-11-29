class AddDeviceToMeasures < ActiveRecord::Migration[5.2]
  def change
    add_reference :measures, :device, foreign_key: true
  end
end
