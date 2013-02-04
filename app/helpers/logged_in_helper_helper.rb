module LoggedInHelperHelper
	ECS_LOGIN_KEY = :ecs_key

	def current_user=(user)
		@current_user = user;
		session[ECS_LOGIN_KEY] = user.ecs_id
	end

	def current_user
		@current_user ||= User.find_ecs_id(session[ECS_LOGIN_KEY])
	end

	def auth_user?
		!@current_user.nil?
	end

	def admin?
		if(@current_user.nil?)
			false
		else
			@current_user.position.admin_permisions
		end
	end
end
