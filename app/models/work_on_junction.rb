class WorkOnJunction < ActiveRecord::Base
	attr_accessible :worker_id , :report_worked_on_id , :hours , :last_viewed

	belongs_to :worker, class_name: "User"
	belongs_to :report_worked_on, class_name: "ProblemReportRecord"
end
