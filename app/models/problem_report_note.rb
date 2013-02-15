class ProblemReportNote < ActiveRecord::Base
	attr_accessible :user_id , :problem_report_record_id  , :comment

	belongs_to :user
	belongs_to :problem_report_record
end
