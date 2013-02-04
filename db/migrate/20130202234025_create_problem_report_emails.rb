class CreateProblemReportEmails < ActiveRecord::Migration
  def change
    create_table :problem_report_emails do |t|
      t.string :from_address
      t.integer :from_user_id
      t.string :to_address
      t.string :message
      t.datetime :sent_on

      t.timestamps
    end
  end
end
