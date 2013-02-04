class AddReportIdToEmail < ActiveRecord::Migration
  def up
  	add_column :problem_report_emails , :problem_report_record_id , :integer
  end

  def down
  	remove_column :problem_report_emails , :problem_report_record_id
  end
end
