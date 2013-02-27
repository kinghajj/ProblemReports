class ProblemReportHistory < ActiveRecord::Base
	attr_accessible :user_id , :problem_report_record_id , :comment, :subject

	belongs_to :user
	belongs_to :problem_report_record

	def self.createHistoryForWorkOnJunctionSave workOnJunction, user

		newHistory = ProblemReportHistory.new
		newHistory.user_id = user.id
		newHistory.problem_report_record_id = workOnJunction.report_worked_on_id

		if user.id == workOnJunction.worker_id
			newHistory.comment = "#{workOnJunction.worker.user_name} has begun working."
			newHistory.subject = newHistory.comment
		else
			newHistory.comment = "#{user.user_name} has assigned #{workOnJunction.worker.user_name} this ticket."
			newHistory.subject = newHistory.comment
		end

		newHistory.save

	end 

	def self.createHistoryForWorkOnJunctionDelete workOnJunction, user
		newHistory = ProblemReportHistory.new
		newHistory.user_id = user.id
		newHistory.problem_report_record_id = workOnJunction.report_worked_on_id

		if user.id == workOnJunction.worker_id
			newHistory.comment = "#{workOnJunction.worker.user_name} has quit working."
			newHistory.subject = newHistory.comment
		else
			newHistory.comment = "#{user.user_name} has unassigned #{workOnJunction.worker.user_name} this ticket."
			newHistory.subject = newHistory.comment
		end

		newHistory.save
	end

	def self.createHistoryForNoteSave note
		newHistory = ProblemReportHistory.new
		newHistory.user_id = note.user_id
		newHistory.problem_report_record_id = note.problem_report_record_id

		newHistory.subject = "#{note.user.user_name} added a note."
		newHistory.comment = "Comment: #{note.comment}. Time Spent: #{note.time_spent}."
		newHistory.save
	end

	def self.createHistoryForNoteChange note
		if(ProblemReportHistory.objectChanged? note)
			newHistory = ProblemReportHistory.new
			newHistory.user_id = note.user_id
			newHistory.problem_report_record_id = note.problem_report_record_id

			newHistory.subject = "#{note.user.user_name} modified a note."

			newHistory.comment = ProblemReportHistory.getObjectChanges note
			newHistory.save

		end
	end

	def self.createHistoryForTicketChange ticket

		if(ProblemReportHistory.objectChanged? ticket)
			newHistory = ProblemReportHistory.new
			newHistory.user_id = ticket.last_modified_by_id
			newHistory.problem_report_record_id = ticket.id

			newHistory.subject = "#{ticket.last_modified_by.user_name} modified the ticket."

			newHistory.comment = ProblemReportHistory.getObjectChanges ticket
			newHistory.save
		end

	end

	private

		def self.getObjectChanges object
			map = object.changes
			map.delete_if{|k,v| k == 'updated_at'}
			ticketChanges = "";

			map.each_pair do |k,v|
				ticketChanges += "Old #{k}: #{v[0]} , New #{k}: #{v[1]}";
			end

			ticketChanges
		end

		def self.objectChanged? object
			map = object.changes
			map.delete_if{|k,v| k == 'updated_at'}

			map.count > 0
		end

end
