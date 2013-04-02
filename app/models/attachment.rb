class Attachment < ActiveRecord::Base
	has_attached_file :file

	belongs_to :problem_report_record
	belongs_to :problem_report_email
end
