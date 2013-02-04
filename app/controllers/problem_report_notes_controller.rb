class ProblemReportNotesController < ApplicationController
  # GET /problem_report_notes
  # GET /problem_report_notes.json
  def index
    @problem_report_notes = ProblemReportNote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problem_report_notes }
    end
  end

  # GET /problem_report_notes/1
  # GET /problem_report_notes/1.json
  def show
    @problem_report_note = ProblemReportNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problem_report_note }
    end
  end

  # GET /problem_report_notes/new
  # GET /problem_report_notes/new.json
  def new
    @problem_report_note = ProblemReportNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problem_report_note }
    end
  end

  # GET /problem_report_notes/1/edit
  def edit
    @problem_report_note = ProblemReportNote.find(params[:id])
  end

  # POST /problem_report_notes
  # POST /problem_report_notes.json
  def create
    @problem_report_note = ProblemReportNote.new(params[:problem_report_note])

    respond_to do |format|
      if @problem_report_note.save
        format.html { redirect_to @problem_report_note, notice: 'Problem report note was successfully created.' }
        format.json { render json: @problem_report_note, status: :created, location: @problem_report_note }
      else
        format.html { render action: "new" }
        format.json { render json: @problem_report_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /problem_report_notes/1
  # PUT /problem_report_notes/1.json
  def update
    @problem_report_note = ProblemReportNote.find(params[:id])

    respond_to do |format|
      if @problem_report_note.update_attributes(params[:problem_report_note])
        format.html { redirect_to @problem_report_note, notice: 'Problem report note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @problem_report_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problem_report_notes/1
  # DELETE /problem_report_notes/1.json
  def destroy
    @problem_report_note = ProblemReportNote.find(params[:id])
    @problem_report_note.destroy

    respond_to do |format|
      format.html { redirect_to problem_report_notes_url }
      format.json { head :no_content }
    end
  end
end
