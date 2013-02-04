class CreateFollowJunctions < ActiveRecord::Migration
  def change
    create_table :follow_junctions do |t|
      t.integer :user_id
      t.integer :problem_report_record_id
      t.datetime :last_viewed

      t.timestamps
    end
  end
end
