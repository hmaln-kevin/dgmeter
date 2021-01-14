class AddTypeToDevices < ActiveRecord::Migration[5.2]
  def change
    add_reference :devices, :type, foreign_key: true
  end
end
