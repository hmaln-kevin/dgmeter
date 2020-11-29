class AddLoadTopicToLoads < ActiveRecord::Migration[5.2]
  def change
    add_reference :loads, :load_topic, foreign_key: true
  end
end
