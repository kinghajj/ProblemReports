class ProblemReportRecordsController < ApplicationController
  require 'will_paginate/array'
  helper_method :defaultColumn , :defaultSortOrder,:workingOnPath,:allReportPath,:followReportPath,:unclaimedReportsPath

  # GET /problem_report_records
  # GET /problem_report_records.json
  def index
    @reports_worked_on = getWorkedOnReports
    @all_reports = getAllReports
    @followed_reports = getFollowReports
    @unclaimed_reports = getUnclaimedReports

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports_worked_on }
    end
  end

  # GET /problem_report_records/1
  # GET /problem_report_records/1.json
  def show
    @problem_report_record = ProblemReportRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problem_report_record }
    end
  end

  # GET /problem_report_records/new
  # GET /problem_report_records/new.json
  def new
    @problem_report_record = ProblemReportRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problem_report_record }
    end
  end

  # GET /problem_report_records/1/edit
  def edit
    @problem_report_record = ProblemReportRecord.find(params[:id])
  end

  # POST /problem_report_records
  # POST /problem_report_records.json
  def create
    @problem_report_record = ProblemReportRecord.new(params[:problem_report_record])

    respond_to do |format|
      if @problem_report_record.save
        format.html { redirect_to @problem_report_record, notice: 'Problem report record was successfully created.' }
        format.json { render json: @problem_report_record, status: :created, location: @problem_report_record }
      else
        format.html { render action: "new" }
        format.json { render json: @problem_report_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /problem_report_records/1
  # PUT /problem_report_records/1.json
  def update
    @problem_report_record = ProblemReportRecord.find(params[:id])

    respond_to do |format|
      if @problem_report_record.update_attributes(params[:problem_report_record])
        format.html { redirect_to @problem_report_record, notice: 'Problem report record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @problem_report_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problem_report_records/1
  # DELETE /problem_report_records/1.json
  def destroy
    @problem_report_record = ProblemReportRecord.find(params[:id])
    @problem_report_record.destroy

    respond_to do |format|
      format.html { redirect_to problem_report_records_url }
      format.json { head :no_content }
    end
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is an accessor for the default column to be used in sorting 

=end

  def defaultColumn
    'subject'
  end


=begin

  @author Chris Kipers
  @date 2/12/13

  This method is an accessor for the default order to be used in sorting 

=end

  def defaultSortOrder
    'asc'
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is an accessor for the path to update the working on table. We have an accessor because this value
  will be passed as a local variable to a partial and I wanted to keep this value in one place.

=end

  def workingOnPath
    'updateWorkingOnTable'
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is an accessor for the path to update the all report table. We have an accessor because this value
  will be passed as a local variable to a partial and I wanted to keep this value in one place.

=end
  def allReportPath
    'updateAllReportsTable'
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is an accessor for the path to update the following report table. We have an accessor because this value
  will be passed as a local variable to a partial and I wanted to keep this value in one place.

=end
  def followReportPath
    'updateFollowReportsTable'
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is an accessor for the path to update the unclaimed report table. We have an accessor because this value
  will be passed as a local variable to a partial and I wanted to keep this value in one place.

=end
  def unclaimedReportsPath
    'updateUnClaimedReportsTable'
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is used to retrive all the problem reports the user is working on.

=end
  def getWorkedOnReports
    column = params[:column] ? params[:column] : defaultColumn
    order = params[:direction] ? params[:direction] : defaultSortOrder
    user = current_user
    if(user)
      user.report_worked_on.paginate(page: params[:page], :per_page => 1).order(column + " " + order)
    end
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is used to retrive all the problem reports.

=end
  def getAllReports
    column = params[:column] ? params[:column] : defaultColumn
    order = params[:direction] ? params[:direction] : defaultSortOrder
    ProblemReportRecord.paginate(page: params[:page], :per_page => 1).order(column + " " + order)
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is used to retrive all the problem reports the user is following.

=end
  def getFollowReports
    column = params[:column] ? params[:column] : defaultColumn
    order = params[:direction] ? params[:direction] : defaultSortOrder
    user = current_user
    if(user)
      user.report_followed.paginate(page: params[:page], :per_page => 1).order(column + " " + order)
    end
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is used to retrive all the problem reports that no users are working on.

=end
  def getUnclaimedReports
    column = params[:column] ? params[:column] : defaultColumn
    order = params[:direction] ? params[:direction] : defaultSortOrder
    reportsWithJunction = Set.new
    WorkOnJunction.all.each{ |rep| reportsWithJunction.add(rep.report_worked_on_id) }

    ProblemReportRecord.where("id NOT IN (?)",reportsWithJunction).paginate(page: params[:page], :per_page => 1).order(column + " " + order)
    
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is used to update the working on table. It does this by requerying the problem reports
  and then using ajax replaces the table with the table parcial using the newly queried problem reports.

=end
  def updateWorkingOnTable
    @reports_worked_on = getWorkedOnReports

    respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is used to update the all problem reports on table. It does this by requerying the problem reports
  and then using ajax replaces the table with the table parcial using the newly queried problem reports.

=end
  def updateAllReportsTable
    @all_reports = getAllReports

    respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is used to update the following report table. It does this by requerying the problem reports
  and then using ajax replaces the table with the table parcial using the newly queried problem reports.

=end
  def updateFollowReportsTable
    @followed_reports = getFollowReports

    respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is used to update the unclaimed report table. It does this by requerying the problem reports
  and then using ajax replaces the table with the table parcial using the newly queried problem reports.

=end
  def updateUnClaimedReportsTable
    @unclaimed_reports = getUnclaimedReports

    respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end
  end


#---------------------------- These methods have to do with working on and following tickets-------

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is used to create a work on junction between the user and the specified problem report. After
  the junction is created all the tables on the index page are refreshed. This is achieved by an ajax script that
  calls the refreshTables js function.

=end
  def workOnReport
      report = ProblemReportRecord.find(params[:id])

      if(!report.nil?)
        current_user.workOnReport report
      end

      respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is used to delete the work on junction between the user and the specified problem report. After
  the junction is deleted all the tables on the index page are refreshed. This is achieved by an ajax script that
  calls the refreshTables js function.

=end
  def quitWorkingOnReport
      report = ProblemReportRecord.find(params[:id])

      if(!report.nil?)
        current_user.quitWorkingOnReport report
      end

      respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is used to create a follow junction between the user and the specified problem report. After
  the junction is created all the tables on the index page are refreshed. This is achieved by an ajax script that
  calls the refreshTables js function.

=end
  def followReport
      report = ProblemReportRecord.find(params[:id])

      if(!report.nil?)
        current_user.followReport report
      end

      respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end
  end

=begin

  @author Chris Kipers
  @date 2/12/13

  This method is used to delete the follow junction between the user and the specified problem report. After
  the junction is deleted all the tables on the index page are refreshed. This is achieved by an ajax script that
  calls the refreshTables js function.

=end
  def unfollowReport
      report = ProblemReportRecord.find(params[:id])

      if(!report.nil?)
        current_user.unfollowReport report
      end

      respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end
  end

  def requestAssigningForm
    @report = ProblemReportRecord.find(params[:id])
    @workers = @report.worker
    respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end
  end

  def assignProblemReports
    workers = params[:worker]
    report = ProblemReportRecord.find(params[:id])

    if !report.nil?
      report.assignProblemReports workers
    end
    
    respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end

  end


end
