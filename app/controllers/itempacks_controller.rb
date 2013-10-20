class ItempacksController < ApplicationController
  # GET /itempacks
  # GET /itempacks.json
  def index
    @itempacks = Itempack.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @itempacks }
    end
  end

  # GET /itempacks/1
  # GET /itempacks/1.json
  def show
    @itempack = Itempack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @itempack }
    end
  end

  # GET /itempacks/new
  # GET /itempacks/new.json
  def new
    @itempack = Itempack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @itempack }
    end
  end

  # GET /itempacks/1/edit
  def edit
    @itempack = Itempack.find(params[:id])
  end

  # POST /itempacks
  # POST /itempacks.json
  def create
    @itempack = Itempack.new(params[:itempack])

    respond_to do |format|
      if @itempack.save
        format.html { redirect_to @itempack, notice: 'Itempack was successfully created.' }
        format.json { render json: @itempack, status: :created, location: @itempack }
      else
        format.html { render action: "new" }
        format.json { render json: @itempack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /itempacks/1
  # PUT /itempacks/1.json
  def update
    @itempack = Itempack.find(params[:id])

    respond_to do |format|
      if @itempack.update_attributes(params[:itempack])
        format.html { redirect_to @itempack, notice: 'Itempack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @itempack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itempacks/1
  # DELETE /itempacks/1.json
  def destroy
    @itempack = Itempack.find(params[:id])
    @itempack.destroy

    respond_to do |format|
      format.html { redirect_to itempacks_url }
      format.json { head :no_content }
    end
  end
end
