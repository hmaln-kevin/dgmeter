class CreateLoadTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :load_topics do |t|
      t.string :description
      t.string :pin

      t.timestamps
    end
  end
end
