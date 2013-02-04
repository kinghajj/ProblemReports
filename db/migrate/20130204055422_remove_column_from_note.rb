class RemoveColumnFromNote < ActiveRecord::Migration
  def up
  	remove_column :problem_report_notes, :created_date
  	remove_column :problem_report_histories, :created_date
  end

  def down
  	add_column :problem_report_notes, :created_date
  	add_column :problem_report_histories, :created_date
  end
end
