class ApplicationController < ActionController::Base
	include LoggedInHelperHelper
  	protect_from_forgery
  	layout :selected_layout

  	private 
  		def selected_layout
  			if(admin?)
  				"admin_layout"
  			elsif(auth_user?)
  				"user_layout"
  			else
  				"unauth_layout"
  			end
  		end
end
