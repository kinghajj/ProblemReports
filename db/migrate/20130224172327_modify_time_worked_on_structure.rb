class ModifyTimeWorkedOnStructure < ActiveRecord::Migration
  def up
  	remove_column :problem_report_records, :hours_worked
  	remove_column :work_on_junctions, :hours
  	add_column :problem_report_notes, :time_spent, :decimal
  end

  def down
  	add_column :problem_report_recorts, :hours_worked, :decimal
  	add_column :works_on_junctions, :hours, :decimal
  	remove_column :problem_report_notes, :time_spent
  end
end
