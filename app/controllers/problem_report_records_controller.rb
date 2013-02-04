class ProblemReportRecordsController < ApplicationController
  # GET /problem_report_records
  # GET /problem_report_records.json
  def index
    @problem_report_records = ProblemReportRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problem_report_records }
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
end
