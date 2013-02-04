class ProblemReportEmail < ActiveRecord::Base
	attr_accessible :from_address , :from_user_id , :to_address , :message , :sent_on ,:problem_report_record_id

	belongs_to :user , :foreign_key => 'from_user_id'
	belongs_to :problem_report_record
end
