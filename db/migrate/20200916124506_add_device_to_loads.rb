class AddDeviceToLoads < ActiveRecord::Migration[5.2]
  def change
    add_reference :loads, :device, foreign_key: true
  end
end
