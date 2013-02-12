class ProblemReportRecord < ActiveRecord::Base
	attr_accessible :subject , :description , :category_id , :priority_id , :date_entered , :date_completed , :date_due , :hours_worked , :system_type_id , :escalation_id , :problem_type_id , :room_building , :room_number , :computer_name , :solution , :status_id , :submitted_by_id , :completed_by_id , :submitters_name , :submitters_email 

	belongs_to :category
	belongs_to :system_type
	belongs_to :escalation
	belongs_to :problem_type
	belongs_to :status
	belongs_to :priority

	belongs_to :sumbitting_user, primary_key: "submitted_by_id" , class_name: "User"
	belongs_to :completing_user, primary_key: "completed_by_id" , class_name: "User"

	has_many :being_worked_on_relationship, foreign_key: "report_worked_on_id" , class_name: "WorkOnJunction", :dependent => :destroy
	has_many :worker, through: :being_worked_on_relationship

	has_many :being_followed_by_relationship, foreign_key: "report_followed_id" , class_name: "FollowJunction", :dependent => :destroy
	has_many :follower, through: :being_followed_by_relationship

	validates :subject, :presence => true
	validates :description, :presence => true
	validates :category_id, :presence => true
	validates :system_type_id, :presence => true
	validates :escalation_id, :presence => true
	validates :status_id, :presence => true
	validates :problem_type_id, :presence => true
	validates :priority_id, :presence => true

	def category_name
		if(category.nil?)
			''
		else
			category.name
		end
	end

	def system_type_name
		if(system_type.nil?)
			''
		else
			system_type.name
		end
	end

	def escalation_name
		if(escalation.nil?)
			''
		else
			escalation.name
		end
	end

	def problem_type_name
		if(problem_type.nil?)
			''
		else
			problem_type.name
		end
	end

	def status_name
		if(status.nil?)
			''
		else
			status.name
		end
	end

	def priority_name
		if(priority.nil?)
			''
		else
			priority.name
		end
	end

	def submitting_users_name
		if(sumbitting_user.nil?)
			''
		else
			sumbitting_user.user_name
		end
	end

	def completers_name
		if(completing_user.nil?)
			''
		else
			completing_user.user_name
		end
	end

end
