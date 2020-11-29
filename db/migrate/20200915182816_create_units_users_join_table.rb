class CreateUnitsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change 
    create_table :units_users do |t|
      t.references :unit, :user
    end
  end
end
