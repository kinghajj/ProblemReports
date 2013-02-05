class Position < ActiveRecord::Base
	attr_accessible :name, :admin_permisions

	has_many :users

	validates :name, :presence => true
	validates :admin_permisions, :inclusion => {:in => [true, false]}
	
	before_destroy do |position|
		count = position.users.count
		if(count != 0)
			position.errors[:id] = "Cannot delete position #{position.name}, #{count} Users have this position"
			false
		end
	end


end
 