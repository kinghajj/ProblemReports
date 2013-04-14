class WorkOnJunctionsController < ApplicationController
  # GET /work_on_junctions
  # GET /work_on_junctions.json
  before_filter :authenticate
  def index
    @work_on_junctions = WorkOnJunction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_on_junctions }
    end
  end

  # GET /work_on_junctions/1
  # GET /work_on_junctions/1.json
  def show
    @work_on_junction = WorkOnJunction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_on_junction }
    end
  end

  # GET /work_on_junctions/new
  # GET /work_on_junctions/new.json
  def new
    @work_on_junction = WorkOnJunction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_on_junction }
    end
  end

  # GET /work_on_junctions/1/edit
  def edit
    @work_on_junction = WorkOnJunction.find(params[:id])
  end

  # POST /work_on_junctions
  # POST /work_on_junctions.json
  def create
    @work_on_junction = WorkOnJunction.new(params[:work_on_junction])

    respond_to do |format|
      if @work_on_junction.save
        format.html { redirect_to @work_on_junction, notice: 'Work on junction was successfully created.' }
        format.json { render json: @work_on_junction, status: :created, location: @work_on_junction }
      else
        format.html { render action: "new" }
        format.json { render json: @work_on_junction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_on_junctions/1
  # PUT /work_on_junctions/1.json
  def update
    @work_on_junction = WorkOnJunction.find(params[:id])

    respond_to do |format|
      if @work_on_junction.update_attributes(params[:work_on_junction])
        format.html { redirect_to @work_on_junction, notice: 'Work on junction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_on_junction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_on_junctions/1
  # DELETE /work_on_junctions/1.json
  def destroy
    @work_on_junction = WorkOnJunction.find(params[:id])
    @work_on_junction.destroy

    respond_to do |format|
      format.html { redirect_to work_on_junctions_url }
      format.json { head :no_content }
    end
  end
end
