class User < ActiveRecord::Base
	attr_accessible :ecs_id , :user_name , :first_name , :last_name , :position_id , :main_phone , :email

	belongs_to :position
	
	has_many :follow_junction_relationship, foreign_key: "follower_id" , class_name: "FollowJunction", :dependent => :destroy
	has_many :report_followed, through: :follow_junction_relationship

	has_many :working_on_junction_relationship, foreign_key: "worker_id" , class_name: "WorkOnJunction",  :dependent => :destroy
	has_many :report_worked_on, through: :working_on_junction_relationship

	validates :ecs_id, :presence => true
	validates :user_name, :presence => true
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :position_id, :presence => true
	
end
