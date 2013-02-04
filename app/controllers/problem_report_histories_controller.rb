class ProblemReportHistoriesController < ApplicationController
  # GET /problem_report_histories
  # GET /problem_report_histories.json
  def index
    @problem_report_histories = ProblemReportHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problem_report_histories }
    end
  end

  # GET /problem_report_histories/1
  # GET /problem_report_histories/1.json
  def show
    @problem_report_history = ProblemReportHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problem_report_history }
    end
  end

  # GET /problem_report_histories/new
  # GET /problem_report_histories/new.json
  def new
    @problem_report_history = ProblemReportHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problem_report_history }
    end
  end

  # GET /problem_report_histories/1/edit
  def edit
    @problem_report_history = ProblemReportHistory.find(params[:id])
  end

  # POST /problem_report_histories
  # POST /problem_report_histories.json
  def create
    @problem_report_history = ProblemReportHistory.new(params[:problem_report_history])

    respond_to do |format|
      if @problem_report_history.save
        format.html { redirect_to @problem_report_history, notice: 'Problem report history was successfully created.' }
        format.json { render json: @problem_report_history, status: :created, location: @problem_report_history }
      else
        format.html { render action: "new" }
        format.json { render json: @problem_report_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /problem_report_histories/1
  # PUT /problem_report_histories/1.json
  def update
    @problem_report_history = ProblemReportHistory.find(params[:id])

    respond_to do |format|
      if @problem_report_history.update_attributes(params[:problem_report_history])
        format.html { redirect_to @problem_report_history, notice: 'Problem report history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @problem_report_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problem_report_histories/1
  # DELETE /problem_report_histories/1.json
  def destroy
    @problem_report_history = ProblemReportHistory.find(params[:id])
    @problem_report_history.destroy

    respond_to do |format|
      format.html { redirect_to problem_report_histories_url }
      format.json { head :no_content }
    end
  end
end
