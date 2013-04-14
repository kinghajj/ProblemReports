class ReportController < ApplicationController
	before_filter :authenticateAdmin
  def index

    @users = User.all
    @status = Status.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end

  end

end