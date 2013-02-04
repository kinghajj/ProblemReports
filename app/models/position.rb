class Position < ActiveRecord::Base
	attr_accessible :name, :admin_permisions

	has_many :users
end
 