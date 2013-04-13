class Category < ActiveRecord::Base
	attr_accessible :name, :id, :created_at, :updated_at

	has_many :problem_report_records

	validates :name, :presence => true

	before_destroy do |catagory|
		count = catagory.problem_report_records.count
		if(count != 0)
			catagory.errors[:id] = "Cannot delete catagory #{catagory.name}, #{count} Problem Report Records have this catagory."
			false
		end
	end

end
