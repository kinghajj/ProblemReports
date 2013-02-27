class ProblemReportNote < ActiveRecord::Base
	attr_accessible :user_id , :problem_report_record_id  , :comment, :time_spent

	belongs_to :user
	belongs_to :problem_report_record

	after_create do |newNote|
		ProblemReportHistory.createHistoryForNoteSave newNote
	end

	after_save do |updatedNote|
		if(!updatedNote.id_changed?)
			ProblemReportHistory.createHistoryForNoteChange updatedNote
		end
	end

	def hasBeenModified?
		if self.updated_at.nil? || self.updated_at == self.created_at
			false
		else
			true
		end
	end
end
