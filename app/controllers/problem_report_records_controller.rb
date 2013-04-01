class ProblemReportRecordsController < ApplicationController
  require 'will_paginate/array'
  helper_method :defaultColumn , :defaultSortOrder,:workingOnPath,:allReportPath,:followReportPath,:unclaimedReportsPath

  # GET /problem_report_records
  # GET /problem_report_records.json
  def index

    if params[:search]
      @all_reports = getSearchedReports
    else
      @all_reports = getAllReports
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @all_reports }
    end
  end

  # GET /problem_report_records/1
  # GET /problem_report_records/1.json
  def show
    @problem_report_record = ProblemReportRecord.find(params[:id])

    if(auth_user?)
      current_user.updateLastViewed @problem_report_record
    end

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

    if(auth_user?)
      current_user.updateLastViewed @problem_report_record
    end
    
  end

  # POST /problem_report_records
  # POST /problem_report_records.json
  def create
    @problem_report_record = ProblemReportRecord.new(params[:problem_report_record])
    isModifying = !@problem_report_record.id.nil?

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
      if @problem_report_record.update_attributes(params[:problem_report_record].merge(:last_modified_by_id => current_user.id))
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



  #-------------- This section has to do with adding notes -------------------

  def addNewNote
    noteText = params[:note]
    timeSpent = params[:time_spent]
    @report = ProblemReportRecord.find(params[:id])

    if !@report.nil?
      if auth_user?
        note = ProblemReportNote.new(:user_id => current_user.id, :problem_report_record_id => @report.id, :comment => noteText, :time_spent => timeSpent)
        note.save
        @report.initializeStatus current_user, true
      end
    end
    
    respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end
  end

  def requestNoteToModify

    @note = ProblemReportNote.find(params[:id]);

    respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end
    
  end

  def modifyNote
    @note = ProblemReportNote.find(params[:id]);
    @note.comment = params[:note]
    @note.time_spent = params[:time_spent]
    @note.save
    @report = ProblemReportRecord.find(@note.problem_report_record_id)

    respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end

  end

  def initializeStatus
    @problem_report_record = ProblemReportRecord.find(params[:id])
    @problem_report_record.initializeStatus current_user, true

    respond_to do |format|
      format.html { redirect_to "/problem_report_records/#{@problem_report_record.id}/edit" }
      format.js {}
    end
  end

  def sendEmail
    @problem_report_record = ProblemReportRecord.find(params[:id])
    message = params[:message]

    if !@problem_report_record.submitters_email.nil?
      EcsMailer.send_email(current_user,@problem_report_record.submitters_email,@problem_report_record,message).deliver
    end
    
    respond_to do |format|
      format.html { redirect_to "/problem_report_records/#{@problem_report_record.id}/edit" }
      format.js {}
    end

  end



#-----Mike: Added These methods to be able to use info table view---------------------------------------------------------------------


  def allReportPath
    'updateAllReportsTable'
  end

  def updateAllReportsTable
    @all_reports = getSearchedReports

    respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end
  end

  def defaultColumn
    'subject'
  end

  def defaultSortOrder
    'asc'
  end

  def problemsPerPage
    5
  end

  def getAllReports
    column = params[:column] ? params[:column] : defaultColumn
    order = params[:direction] ? params[:direction] : defaultSortOrder
    ProblemReportRecord.paginate(page: params[:page], :per_page => problemsPerPage).order(column + " " + order)
  end

  def getSearchedReports
    column = params[:column] ? params[:column] : defaultColumn
    order = params[:direction] ? params[:direction] : defaultSortOrder
    ProblemReportRecord.search(params[:search]).paginate(page: params[:page], :per_page => problemsPerPage).order(column + " " + order)
  end

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

  def requestAssigningForm
    @report = ProblemReportRecord.find(params[:id])
    @workers = @report.worker
    respond_to do |format|
      format.html { render action: "index" }
      format.js {}
    end
  end

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

end
