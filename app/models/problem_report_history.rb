class ProblemReportHistory < ActiveRecord::Base
	attr_accessible :user_id , :problem_report_record_id , :created_date , :comment

	belongs_to :user
	belongs_to :problem_report_record
end
