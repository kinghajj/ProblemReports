class ProblemType < ActiveRecord::Base
	attr_accessible :name, :created_at, :updated_at

	has_many :problem_report_records

	validates :name, :presence => true

	before_destroy do |problemType|
		count = problemType.problem_report_records.count
		if(count != 0)
			problemType.errors[:id] = "Cannot delete problem type #{problemType.name}, #{count} Problem Report Records have this problem type."
			false
		end
	end
end
