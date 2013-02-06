class User < ActiveRecord::Base
	attr_accessible :ecs_id , :user_name , :first_name , :last_name , :position_id , :main_phone , :email

	belongs_to :position
	
	has_many :follow_junction_relationship, foreign_key: "follower_id" , class_name: "FollowJunction", :dependent => :destroy
	has_many :report_followed, through: :follow_junction_relationship

	has_many :working_on_junction_relationship, foreign_key: "worker_id" , class_name: "WorkOnJunction",  :dependent => :destroy
	has_many :report_worked_on, through: :working_on_junction_relationship

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
