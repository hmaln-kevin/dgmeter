class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :description
      t.string :localization

      t.timestamps
    end
  end
end
