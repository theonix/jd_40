class LivesController < ApplicationController
  before_action :set_life, only: [:show, :edit, :update, :destroy]

  # GET /lives
  # GET /lives.json
  def index
    @lives = Life.all
  end

  # GET /lives/1
  # GET /lives/1.json
  def show
  end

  # GET /lives/new
  def new
    @life = Life.new
  end

  # GET /lives/1/edit
  def edit
  end

  # POST /lives
  # POST /lives.json
  def create
    @life = Life.new(life_params)

    respond_to do |format|
      if @life.save
        format.html { redirect_to @life, notice: 'Life was successfully created.' }
        format.json { render action: 'show', status: :created, location: @life }
      else
        format.html { render action: 'new' }
        format.json { render json: @life.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lives/1
  # PATCH/PUT /lives/1.json
  def update
    respond_to do |format|
      if @life.update(life_params)
        format.html { redirect_to @life, notice: 'Life was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @life.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lives/1
  # DELETE /lives/1.json
  def destroy
    @life.destroy
    respond_to do |format|
      format.html { redirect_to lives_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_life
      @life = Life.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def life_params
      params[:life]
    end
end
