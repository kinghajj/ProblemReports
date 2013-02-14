class VisitorController < ApplicationController

	def index
		if auth_user?
			redirect_to problem_report_records_path
		end
	end
end
