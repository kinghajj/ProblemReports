class VisitorController < ApplicationController

	def index
		if auth_user?
			redirect_to '/home'
		end
	end
end
