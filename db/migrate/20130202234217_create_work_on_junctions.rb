class CreateWorkOnJunctions < ActiveRecord::Migration
  def change
    create_table :work_on_junctions do |t|
      t.integer :user_id
      t.integer :problem_report_record_id
      t.decimal :hours
      t.datetime :last_viewed

      t.timestamps
    end
  end
end
