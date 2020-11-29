class CreateLoads < ActiveRecord::Migration[5.2]
  def change
    create_table :loads do |t|
      t.string :description
      t.boolean :state
      t.datetime :schedule

      t.timestamps
    end
  end
end
