class AddInitializeFlagToTicket < ActiveRecord::Migration
  def up
  	 add_column :problem_report_records, :initialized, :boolean
  end

  def down
  	remove_column :problem_report_records, :initialized
  end
end
