class ChangeWorkOnColumnNames < ActiveRecord::Migration
  def up
  	rename_column :work_on_junctions , :user_id , :worker_id
  	rename_column :work_on_junctions , :problem_report_record_id , :report_worked_on_id
  end

  def down
  	rename_column :work_on_junctions , :worker_id , :user_id
  	rename_column :work_on_junctions , :report_worked_on_id , :problem_report_record_id
  end
end
