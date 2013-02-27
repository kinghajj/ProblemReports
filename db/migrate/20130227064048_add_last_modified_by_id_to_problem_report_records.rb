class AddLastModifiedByIdToProblemReportRecords < ActiveRecord::Migration
  def up
  	add_column :problem_report_records , :last_modified_by_id , :integer
  end

  def down
  	remove_column :problem_report_records, :last_modified_by_id
  end
end
