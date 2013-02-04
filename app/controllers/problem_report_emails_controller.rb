class ProblemReportEmailsController < ApplicationController
  # GET /problem_report_emails
  # GET /problem_report_emails.json
  def index
    @problem_report_emails = ProblemReportEmail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problem_report_emails }
    end
  end

  # GET /problem_report_emails/1
  # GET /problem_report_emails/1.json
  def show
    @problem_report_email = ProblemReportEmail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problem_report_email }
    end
  end

  # GET /problem_report_emails/new
  # GET /problem_report_emails/new.json
  def new
    @problem_report_email = ProblemReportEmail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problem_report_email }
    end
  end

  # GET /problem_report_emails/1/edit
  def edit
    @problem_report_email = ProblemReportEmail.find(params[:id])
  end

  # POST /problem_report_emails
  # POST /problem_report_emails.json
  def create
    @problem_report_email = ProblemReportEmail.new(params[:problem_report_email])

    respond_to do |format|
      if @problem_report_email.save
        format.html { redirect_to @problem_report_email, notice: 'Problem report email was successfully created.' }
        format.json { render json: @problem_report_email, status: :created, location: @problem_report_email }
      else
        format.html { render action: "new" }
        format.json { render json: @problem_report_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /problem_report_emails/1
  # PUT /problem_report_emails/1.json
  def update
    @problem_report_email = ProblemReportEmail.find(params[:id])

    respond_to do |format|
      if @problem_report_email.update_attributes(params[:problem_report_email])
        format.html { redirect_to @problem_report_email, notice: 'Problem report email was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @problem_report_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problem_report_emails/1
  # DELETE /problem_report_emails/1.json
  def destroy
    @problem_report_email = ProblemReportEmail.find(params[:id])
    @problem_report_email.destroy

    respond_to do |format|
      format.html { redirect_to problem_report_emails_url }
      format.json { head :no_content }
    end
  end
end
