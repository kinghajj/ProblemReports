require 'date'

class ProblemReportRecord < ActiveRecord::Base
	attr_accessible :subject , :description , :category_id , :priority_id , :date_entered , :date_completed , :date_due , :system_id , :escalation_id , :problem_type_id , :room_building , :room_number , :computer_name , :solution , :status_id , :submitted_by_id , :completed_by_id , :submitters_name , :submitters_email,  :last_modified_by_id,
                  :created_at, :updated_at, :initialized

	belongs_to :category
	belongs_to :system
	belongs_to :escalation
	belongs_to :problem_type
	belongs_to :status
	belongs_to :priority

	belongs_to :sumbitting_user, foreign_key: "submitted_by_id" , class_name: "User"
	belongs_to :completing_user, foreign_key: "completed_by_id" , class_name: "User"
	belongs_to :last_modified_by, foreign_key: "last_modified_by_id", class_name: "User"

	has_many :being_worked_on_relationship, foreign_key: "report_worked_on_id" , class_name: "WorkOnJunction", :dependent => :destroy
	has_many :worker, through: :being_worked_on_relationship

	has_many :being_followed_by_relationship, foreign_key: "report_followed_id" , class_name: "FollowJunction", :dependent => :destroy
	has_many :follower, through: :being_followed_by_relationship

	has_many :problem_report_notes
	has_many :problem_report_histories
	has_many :problem_report_emails

	has_many :attachments

	validates :subject, :presence => true
	validates :description, :presence => true
	validates :category_id, :presence => true
	validates :system_id, :presence => true
	#validates :escalation_id, :presence => true
	#validates :status_id, :presence => true
	validates :problem_type_id, :presence => true
	#validates :priority_id, :presence => true


	#scopes
	#scope :completed, joins(:status).where("statuses.complete = true");
	
	before_create do |newTicket|
		if(newTicket.status_id.nil?)
			newStatus = Status.where('first_status = ?',true).first
			newTicket.status_id = newStatus.id
		end
	end

	before_save do |ticket|
		if(!ticket.id_changed? && !ticket.id.nil?)
			if(!ticket.initialized)
				self.initializeStatus ticket.last_modified_by, false
			end
		end
	end

	after_save do |ticket|

		if(!ticket.id_changed?)
			ProblemReportHistory.createHistoryForTicketChange ticket
		end
	end

	def initializeStatus user, saveRecord
		
		self.initialized = true
		self.last_modified_by_id = user.id

		if(!self.submitters_email.nil?)
			EcsMailer.start_email(self,user).deliver
		end
		
		if saveRecord
			self.save
		end
	end

	def category_name
		if(category.nil?)
			''
		else
			category.name
		end
	end

	def system_name

		if(system.nil?)
			''
		else
			system.name
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

	def assignProblemReports workers, assignee

		if workers.nil?
			workers = Array.new
		end

	    previousWorkers = Set.new
	    assignedWorkers = Set.new

	    newWorkers = Set.new
	    deleteWorkers = Set.new

	    self.worker.each{|worker| previousWorkers.add(worker.id)}
	    workers.each{|workerId| assignedWorkers.add(workerId.to_i)}

	    #loop to find new workers

	    assignedWorkers.each do |curWorker|

	      if(!previousWorkers.member? curWorker)
	          newWorkers.add(curWorker)
	      end

	    end

	    #loop to find workers to delete

	    previousWorkers.each do |curWorker|

	      if(!assignedWorkers.member? curWorker)
	          deleteWorkers.add(curWorker)
	      end

	    end

	    #Query groups in bulk to reduce SQL Queries 

	    usersToAssign = User.where('id IN (?)',newWorkers);
	    usersToUnAssign = User.where('id IN (?)',deleteWorkers);

	    #actually do the assigning

	    if(!usersToAssign.nil?)
		    usersToAssign.each do |user|
		      user.workOnReport self, assignee
		    end
		end

	    #actually do the unassigning
	    if(!usersToUnAssign.nil?)
		    usersToUnAssign.each do |user|
		      user.quitWorkingOnReport self, assignee
		    end
		end

	  end

	  def getFeed
	  	allNotes = self.problem_report_notes
	  	allEmails = self.problem_report_emails
	  	allFeedItems = Array.new
	  	allFeedItems.concat allNotes
	  	allFeedItems.concat allEmails
	  	allFeedItems.sort!{|a,b| a.created_at <=> b.created_at}
	  	return allFeedItems
    end

    def self.search(search)
      if search
        where("lower(subject) like ?", "%#{search}%").order("lower(subject)")
      else
        scoped
      end
    end


  def self.getNumberOfProblemReportsWithStatus(status, start_date, end_date)

    if start_date && end_date
      time = (DateTime.now).strftime('%T%:z')

      start_date = DateTime.parse(start_date)
      end_date = DateTime.parse(end_date << 'T' << time)

      problem_reports = ProblemReportRecord.where("status_id = ? AND created_at between ? AND ?", status.id, start_date, end_date)
      number_of_problem_reports = problem_reports.count
    else
      problem_reports = ProblemReportRecord.where("status_id = ?", status.id)
      number_of_problem_reports = problem_reports.count
    end

    return number_of_problem_reports
  end

  def self.getSubmittedProblemReports(user, start_date, end_date)

    if start_date && end_date
      time = (DateTime.now).strftime('%T%:z')

      start_date = DateTime.parse(start_date)
      end_date = DateTime.parse(end_date << 'T' << time)

      problem_reports = ProblemReportRecord.where("submitted_by_id = ? AND created_at between ? AND ?", user.id, start_date, end_date)
      number_of_problem_reports = problem_reports.count
    else
      problem_reports = ProblemReportRecord.where("submitted_by_id = ?", user.id)
      number_of_problem_reports = problem_reports.count
    end

    return number_of_problem_reports
  end

end
