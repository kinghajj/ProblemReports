class Status < ActiveRecord::Base
	attr_accessible :name, :first_status , :complete

	has_many :problem_report_records

	validates :name, :presence => true

	before_destroy do |status|
		count = status.problem_report_records.count
		if(count != 0)
			status.errors[:id] = "Cannot delete status #{status.name}, #{count} Problem Report Records have this status."
			false
		end
	end
end
