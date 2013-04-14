class FollowJunctionsController < ApplicationController
  # GET /follow_junctions
  # GET /follow_junctions.json
  before_filter :authenticate
  def index
    @follow_junctions = FollowJunction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @follow_junctions }
    end
  end

  # GET /follow_junctions/1
  # GET /follow_junctions/1.json
  def show
    @follow_junction = FollowJunction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @follow_junction }
    end
  end

  # GET /follow_junctions/new
  # GET /follow_junctions/new.json
  def new
    @follow_junction = FollowJunction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @follow_junction }
    end
  end

  # GET /follow_junctions/1/edit
  def edit
    @follow_junction = FollowJunction.find(params[:id])
  end

  # POST /follow_junctions
  # POST /follow_junctions.json
  def create
    @follow_junction = FollowJunction.new(params[:follow_junction])

    respond_to do |format|
      if @follow_junction.save
        format.html { redirect_to @follow_junction, notice: 'Follow junction was successfully created.' }
        format.json { render json: @follow_junction, status: :created, location: @follow_junction }
      else
        format.html { render action: "new" }
        format.json { render json: @follow_junction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /follow_junctions/1
  # PUT /follow_junctions/1.json
  def update
    @follow_junction = FollowJunction.find(params[:id])

    respond_to do |format|
      if @follow_junction.update_attributes(params[:follow_junction])
        format.html { redirect_to @follow_junction, notice: 'Follow junction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @follow_junction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follow_junctions/1
  # DELETE /follow_junctions/1.json
  def destroy
    @follow_junction = FollowJunction.find(params[:id])
    @follow_junction.destroy

    respond_to do |format|
      format.html { redirect_to follow_junctions_url }
      format.json { head :no_content }
    end
  end
end
