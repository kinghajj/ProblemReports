class User < ActiveRecord::Base
	attr_accessible :ecs_id , :user_name ,:show_description, :first_name , :last_name , :position_id , :main_phone , :email,:show_catagory , :show_priority ,:show_date_entered , :show_date_completed ,:show_due_date , :show_hours_worked ,
	:show_system_type , :show_escalation ,:show_problem_type , :show_room_building ,:show_room_number , :show_computer_name ,:show_solution , :show_status ,:show_submitted_by , :show_completed_by ,:show_submitters_name ,:show_submitters_email

	belongs_to :position
	
	has_many :follow_junction_relationship, foreign_key: "follower_id" , class_name: "FollowJunction", :dependent => :destroy
	has_many :report_followed, through: :follow_junction_relationship

	has_many :working_on_junction_relationship, foreign_key: "worker_id" , class_name: "WorkOnJunction",  :dependent => :destroy
	has_many :report_worked_on, through: :working_on_junction_relationship

	has_many :created_reports, foreign_key: "submitted_by_id", class_name: "ProblemReportRecord"
	has_many :completed_reports, foreign_key: "completed_by_id", class_name: "ProblemReportRecord"

	validates :ecs_id, :presence => true
	validates :user_name, :presence => true
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :position_id, :presence => true


	# ------------ THE FOLLOW METHODS MANAGE FOLLOWING AND WORKING ON REPORT MANAGEMENT ----------
	def workOnReport report
		if(!self.workingOnReport? report)
			newJunction = WorkOnJunction.new(:worker_id => self.id, :report_worked_on_id => report.id, :hours => 0, :last_viewed => DateTime.now)
			newJunction.save
		end
	end

	def quitWorkingOnReport report
		junctions = WorkOnJunction.where("worker_id = #{self.id} AND report_worked_on_id = #{report.id}")

		if(!junctions.nil?)
			junctions.destroy_all
		end
	end

	def followReport report
		if(!self.followingReport? report)
			newJunction = FollowJunction.new(:follower_id => self.id, :report_followed_id => report.id, :last_viewed => DateTime.now)
			newJunction.save
		end
	end

	def unfollowReport report
		junctions = FollowJunction.where("follower_id = #{self.id} AND report_followed_id = #{report.id}")

		if(!junctions.nil?)
			junctions.destroy_all
		end
	end

	def updateLastViewed report
		followJunctions = FollowJunction.where("follower_id = #{self.id} AND report_followed_id = #{report.id}")

		if(!followJunctions.nil?)
			followJunctions.each do |fj|
				fj.last_viewed = DateTime.now
			end
			followJunctions.update_all
		end

		workingJunctions = WorkOnJunction.where("worker_id = #{self.id} AND report_worked_on_id = #{report.id}")

		if(!workingJunctions.nil?)
			workingJunctions.each do |wj|
				wj.last_viewed = DateTime.now
			end
			workingJunctions.update_all
		end

	end

	def workingOnReport? report
		WorkOnJunction.exists?(:worker_id => self.id, :report_worked_on_id => report.id)
	end

	def followingReport? report
		FollowJunction.exists?(:follower_id => self.id, :report_followed_id => report.id)
	end

	#------------------------------------------------------------------------------------------

	
end
