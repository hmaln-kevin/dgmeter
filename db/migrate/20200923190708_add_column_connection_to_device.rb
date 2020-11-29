class AddColumnConnectionToDevice < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :connection, :boolean
  end
end
