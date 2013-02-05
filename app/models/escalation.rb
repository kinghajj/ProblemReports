class Escalation < ActiveRecord::Base
	attr_accessible :name

	has_many :problem_report_records

	validates :name, :presence => true

	before_destroy do |escalation|
		count = escalation.problem_report_records.count
		if(count != 0)
			escalation.errors[:id] = "Cannot delete escalation #{escalation.name}, #{count} Problem Report Records have this escalation."
			false
		end
	end
	
end
