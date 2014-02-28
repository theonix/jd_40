class DevicePositionsController < ApplicationController
  
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  
  before_action :set_device_position, only: [:show, :edit, :update, :destroy]

  # GET /device_positions
  # GET /device_positions.json
  def index
    @device_positions = DevicePosition.all
  end

  # GET /device_positions/1
  # GET /device_positions/1.json
  def show
  end

  # GET /device_positions/new
  def new
    @device_position = DevicePosition.new
  end

  # GET /device_positions/1/edit
  def edit
  end

  # POST /device_positions
  # POST /device_positions.json
  def create
    
    @device_position = DevicePosition.new(device_position_params)

    respond_to do |format|
      if @device_position.save
        format.html { redirect_to @device_position, notice: 'Device position was successfully created.' }
        format.json { render action: 'show', status: :created, location: @device_position }
        #puts @device_position.inspect
        #render :json => {:id => @device_position.id}, status: :created
      else
        #format.html { render action: 'new' }
        #format.json { render json: @device_position.errors, status: :unprocessable_entity }
        render json: @device_position.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /device_positions/1
  # PATCH/PUT /device_positions/1.json
  def update
    respond_to do |format|
      if @device_position.update(device_position_params)
        format.html { redirect_to @device_position, notice: 'Device position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @device_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_positions/1
  # DELETE /device_positions/1.json
  def destroy
    @device_position.destroy
    respond_to do |format|
      format.html { redirect_to device_positions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_position
      @device_position = DevicePosition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_position_params
      #params[:device_position] || params[:params]
      params.require(:device_position).permit(:device_id, :lat, :lng)
    end
end
