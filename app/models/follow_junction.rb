class FollowJunction < ActiveRecord::Base
	attr_accessible :follower_id , :report_followed_id , :last_viewed

	belongs_to :follower, class_name: "User"
	belongs_to :report_followed ,class_name: "ProblemReportRecord"
end
