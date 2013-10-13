class SkinsController < ApplicationController
  # GET /skins
  # GET /skins.json
  def index
    @skins = Skin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skins }
    end
  end

  # GET /skins/1
  # GET /skins/1.json
  def show
    @skin = Skin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skin }
    end
  end

  # GET /skins/new
  # GET /skins/new.json
  def new
    @skin = Skin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skin }
    end
  end

  # GET /skins/1/edit
  def edit
    @skin = Skin.find(params[:id])
  end

  # POST /skins
  # POST /skins.json
  def create
    @skin = Skin.new(params[:skin])

    respond_to do |format|
      if @skin.save
        format.html { redirect_to @skin, notice: 'Skin was successfully created.' }
        format.json { render json: @skin, status: :created, location: @skin }
      else
        format.html { render action: "new" }
        format.json { render json: @skin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /skins/1
  # PUT /skins/1.json
  def update
    @skin = Skin.find(params[:id])

    respond_to do |format|
      if @skin.update_attributes(params[:skin])
        format.html { redirect_to @skin, notice: 'Skin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skins/1
  # DELETE /skins/1.json
  def destroy
    @skin = Skin.find(params[:id])
    @skin.destroy

    respond_to do |format|
      format.html { redirect_to skins_url }
      format.json { head :no_content }
    end
  end
end
