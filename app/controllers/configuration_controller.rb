class ConfigurationController < ApplicationController
	before_filter :authenticateAdmin
	def index

	end
end
