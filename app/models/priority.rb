class Priority < ActiveRecord::Base
	attr_accessible :name

	has_many :problem_report_records

	validates :name, :presence => true

	before_destroy do |priority|
		count = priority.problem_report_records.count
		if(count != 0)
			priority.errors[:id] = "Cannot delete priority #{priority.name}, #{count} Problem Report Records have this priority."
			false
		end
	end
end
