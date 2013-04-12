class ChangeReferenceNameOnAttachment < ActiveRecord::Migration
  def up
  	rename_column :attachments, :problem_reports_record_id, :problem_report_record_id
  	rename_column :attachments, :problem_reports_email_id, :problem_report_email_id
  end

  def down
  	rename_column :attachments, :problem_report_record_id, :problem_reports_record_id
  	rename_column :attachments, :problem_report_email_id, :problem_reports_email_id
  end
end
