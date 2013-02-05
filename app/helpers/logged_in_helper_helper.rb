module LoggedInHelperHelper
	ECS_LOGIN_KEY = :ecs_key

	def sign_in(user)
		self.current_user = user
		session[ECS_LOGIN_KEY] = user.ecs_id
	end

	def sign_out
		self.current_user = nil
		session[ECS_LOGIN_KEY] = nil
	end

	def current_user=(user)
		@current_user = user;
	end

	def current_user
		@current_user ||= User.find_by_ecs_id(session[ECS_LOGIN_KEY])
	end

	def auth_user?
		!self.current_user.nil?
	end

	def admin?
		if(self.current_user.nil?)
			false
		else
			self.current_user.position.admin_permisions
		end
	end
end
