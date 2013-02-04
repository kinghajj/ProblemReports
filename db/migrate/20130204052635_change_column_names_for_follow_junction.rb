class ChangeColumnNamesForFollowJunction < ActiveRecord::Migration
  def up
  	rename_column :follow_junctions , :user_id , :follower_id
  	rename_column :follow_junctions , :problem_report_record_id , :report_followed_id
  end

  def down
  	rename_column :follow_junctions , :follower_id , :user_id
  	rename_column :follow_junctions , :report_followed_id , :problem_report_record_id
  end
end
