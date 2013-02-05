class ChangeReportRecordPriorityColumn < ActiveRecord::Migration
  def up
  	rename_column :problem_report_records , :priority , :priority_id
  end

  def down
  	rename_column :problem_report_records , :priority_id , :priority
  end
end
