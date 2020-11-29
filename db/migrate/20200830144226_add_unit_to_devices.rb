class AddUnitToDevices < ActiveRecord::Migration[5.2]
  def change
    add_reference :devices, :unit, foreign_key: true
  end
end
