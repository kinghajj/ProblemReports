require 'active_support'

class ReportController < ApplicationController
	before_filter :authenticateAdmin
  def index

    @users = User.all
    @status = Status.all

    if params[:end_date] == nil && params[:start_date] == nil
      current_date = Date.parse(((DateTime.now).strftime('%F')))

      params[:end_date] = current_date.to_s
      params[:start_date] = current_date.prev_month.to_s
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end

  end

end