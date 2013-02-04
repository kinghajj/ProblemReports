class CreateProblemReportRecords < ActiveRecord::Migration
  def change
    create_table :problem_report_records do |t|
      t.string :subject
      t.string :description
      t.integer :catagory_id
      t.integer :priority
      t.date :date_entered
      t.date :date_completed
      t.date :date_due
      t.decimal :hours_worked
      t.integer :system_type_id
      t.integer :escalation_id
      t.integer :problem_type_id
      t.string :room_building
      t.string :room_number
      t.string :computer_name
      t.string :solution
      t.integer :status_id
      t.integer :submitted_by_id
      t.integer :completed_by_id
      t.string :submitters_name
      t.string :submitters_email

      t.timestamps
    end
  end
end
