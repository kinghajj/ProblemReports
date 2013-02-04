class ProblemReportRecord < ActiveRecord::Base
	attr_accessible :subject , :description , :catagory_id , :priority , :date_entered , :date_completed , :date_due , :hours_worked , :system_type_id , :escalation_id , :problem_type_id , :room_building , :room_number , :computer_name , :solution , :status_id , :submitted_by_id , :completed_by_id , :submitters_name , :submitters_email 

	belongs_to :catagory
	belongs_to :system_type
	belongs_to :escalation
	belongs_to :problem_type
	belongs_to :status

	belongs_to :sumbitting_user, primary_key: "submitted_by_id" , class_name: "user"
	belongs_to :completing_user, primary_key: "completed_by_id" , class_name: "user"

	has_many :being_worked_on_relationship, foreign_key: "report_worked_on_id" , class_name: "WorkOnJunction"
	has_many :worker, through: :being_worked_on_relationship

	has_many :being_followed_by_relationship, foreign_key: "report_followed_id" , class_name: "FollowJunction"
	has_many :follower, through: :being_followed_by_relationship

end
