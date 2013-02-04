class CreateProblemReportHistories < ActiveRecord::Migration
  def change
    create_table :problem_report_histories do |t|
      t.integer :user_id
      t.integer :problem_report_record_id
      t.datetime :created_date
      t.string :comment

      t.timestamps
    end
  end
end
