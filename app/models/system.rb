class System < ActiveRecord::Base
	attr_accessible :name

	has_many :problem_report_records
end
