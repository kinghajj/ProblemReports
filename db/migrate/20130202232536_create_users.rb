class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :ecs_id
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.integer :position_id
      t.string :main_phone
      t.string :email

      t.timestamps
    end
  end
end
