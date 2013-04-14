class ChangeSystemForeignKey < ActiveRecord::Migration
  def up
  	rename_column :problem_report_records , :system_type_id , :system_id
  end

  def down
  	rename_column :problem_report_records , :system_id , :system_type_id
  end
end
