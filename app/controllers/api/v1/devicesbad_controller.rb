class Api::V1::DevicesController < ApplicationController
  
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  
  before_filter :restrict_access
  

  # GET /devices/connect.json
  def connect
    
    @device = Device.find_or_initiliaze(device_params[:model])
    @device.update(device_params)
    
    respond_to do |format|
     if @device.save
        format.json { render action: 'show', status: :created, location: @device }
      else
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
    
  end  
  
  # GET /devices/position.json
  def last_positions
    @devices_positions = DevicePositions.all
  end

  # POST /devices/position.json
  def save_position
    @devices = Device.all
  end  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params[:device].delete(:connect)
      params.require(:device).permit(:model, :uiid, :os, :connected)
    end
  
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
    ApiKey.exists?(access_token: token)
  end
end
  
  
  
end
