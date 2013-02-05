class System < ActiveRecord::Base
	attr_accessible :name

	has_many :problem_report_records

	validates :name, :presence => true

	before_destroy do |system|
		count = system.problem_report_records.count
		if(count != 0)
			system.errors[:id] = "Cannot delete system #{system.name}, #{count} Problem Report Records have this system."
			false
		end
	end
end
