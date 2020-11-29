class CreateMeasures < ActiveRecord::Migration[5.2]
  def change
    create_table :measures do |t|
      t.string :date
      t.float :voltage
      t.float :current
      t.float :power
      t.float :energy
      t.float :frequency
      t.float :pf

      t.timestamps
    end
  end
end
