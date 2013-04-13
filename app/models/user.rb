class User < ActiveRecord::Base
	attr_accessible :ecs_id , :user_name ,:show_description, :first_name , :last_name , :position_id , :main_phone , :email,:show_catagory , :show_priority ,:show_date_entered , :show_date_completed ,:show_due_date , :show_hours_worked ,
	:show_system_type , :show_escalation ,:show_problem_type , :show_room_building ,:show_room_number , :show_computer_name ,:show_solution , :show_status ,:show_submitted_by , :show_completed_by ,:show_submitters_name ,:show_submitters_email,:show_subject,:email_signature,
  :id, :created_at, :updated_at, :show_date_entered, :show_date_completed

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

=begin

	@author Chris Kipers
	@date 2/12/13

	This method creates a works on junction object between the user and the specified problem report record if it does not exist yet

=end

	def workOnReport report, assignee = nil

		if assignee.nil?
			assignee = self
		end

		if(!self.workingOnReport? report)
			newJunction = WorkOnJunction.new(:worker_id => self.id, :report_worked_on_id => report.id, :last_viewed => DateTime.now)
			
			if newJunction.save
				ProblemReportHistory.createHistoryForWorkOnJunctionSave newJunction, assignee
			end
		end
	end

=begin

	@author Chris Kipers
	@date 2/12/13

	This method deletes works on junction objects between the user and the specified problem report record 

=end
	def quitWorkingOnReport report, assignee = nil

		if assignee.nil?
			assignee = self
		end

		junctions = WorkOnJunction.where("worker_id = #{self.id} AND report_worked_on_id = #{report.id}")

		if(!junctions.nil?)
			ProblemReportHistory.createHistoryForWorkOnJunctionDelete junctions[0], assignee
			junctions.destroy_all
		end
	end


=begin

	@author Chris Kipers
	@date 2/12/13

	This method creates a follow junction object between the user and the specified problem report record if it does not exist yet

=end
	def followReport report
		if(!self.followingReport? report)
			newJunction = FollowJunction.new(:follower_id => self.id, :report_followed_id => report.id, :last_viewed => DateTime.now)
			newJunction.save
		end
	end

=begin

	@author Chris Kipers
	@date 2/12/13

	This method deletes follow junction objects between the user and the specified problem report record 

=end
	def unfollowReport report
		junctions = FollowJunction.where("follower_id = #{self.id} AND report_followed_id = #{report.id}")

		if(!junctions.nil?)
			junctions.destroy_all
		end
	end

=begin

	@author Chris Kipers
	@date 2/12/13

	This method updates the last_viewed field on FollowJunction and WorkOnJunction objects between
	the user and specific problem report record. This method is used to clear the notifications the user gets for 
	specific problem report record.

=end
	def updateLastViewed report
		followJunctions = FollowJunction.where("follower_id = #{self.id} AND report_followed_id = #{report.id}")

		if(!followJunctions.nil?)
			FollowJunction.transaction do
				followJunctions.each do |fj|
					fj.last_viewed = DateTime.now
					fj.save
				end
			end
		end

		workingJunctions = WorkOnJunction.where("worker_id = #{self.id} AND report_worked_on_id = #{report.id}")

		if(!workingJunctions.nil?)
			WorkOnJunction.transaction do
				workingJunctions.each do |wj|
					wj.last_viewed = DateTime.now
					wj.save
				end
			end
		end

	end

=begin

	@author Chris Kipers
	@date 2/12/13

	This method is used to see if there is already a works on junction between the user and the 
	specified problem report record 

=end
	def workingOnReport? report
		WorkOnJunction.exists?(:worker_id => self.id, :report_worked_on_id => report.id)
	end

=begin

	@author Chris Kipers
	@date 2/12/13

	This method is used to see if there is already a follows junction between the user and the 
	specified problem report record 

=end
	def followingReport? report
		FollowJunction.exists?(:follower_id => self.id, :report_followed_id => report.id)
	end

	#------------------------------------------------------------------------------------------

	def getNotifications
		problemReportIdSet = Set.new

		histories = ProblemReportHistory.joins("JOIN work_on_junctions ON problem_report_histories.problem_report_record_id = work_on_junctions.report_worked_on_id AND problem_report_histories.created_at > work_on_junctions.last_viewed").where("work_on_junctions.worker_id = ? AND problem_report_histories.user_id != ?",self.id,self.id)
		Notification.buildNotifications histories


	end

end
