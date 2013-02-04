class CreateEscalations < ActiveRecord::Migration
  def change
    create_table :escalations do |t|
      t.string :name

      t.timestamps
    end
  end
end
