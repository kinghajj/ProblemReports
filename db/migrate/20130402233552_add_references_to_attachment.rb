class AddReferencesToAttachment < ActiveRecord::Migration
  def up
  	add_column :attachments, :problem_reports_record_id, :integer
    add_column :attachments, :problem_reports_email_id, :integer
  end

  def down
  	remove_column :attachments, :problem_reports_record_id
    remove_column :attachments, :problem_reports_email_id
  end
end
