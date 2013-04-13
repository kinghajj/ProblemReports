class System < ActiveRecord::Base
	attr_accessible :name, :id,:created_at, :updated_at

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
