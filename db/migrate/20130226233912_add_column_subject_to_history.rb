class AddColumnSubjectToHistory < ActiveRecord::Migration
  def up
  	add_column :problem_report_histories, :subject, :string
  end

  def down
  	remove_column :problem_report_histories, :subject
  end
end
