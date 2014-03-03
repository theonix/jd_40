class Api::V1::DevicesController < ApplicationController

  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  #before_filter :restrict_access
  
  # GET api/v1/devices
  def index
    @devices = Device.all
    render json: @devices
  end
  
  # GET api/v1/devices/position
  def last_positions
    @devices_positions = DevicePosition.all
    render json: @devices_positions
  end

  # POST /devices/:id/position
  def save_position
    
    @device = Device.find(device_position_params[:device_id])
  
    puts "save akk positins: #{params[:save_all_positions]}"
    
    save_all_positions = params[:save_all_positions]
    
    last_position = nil
    
    if @device.positions.empty? || save_all_positions
      last_position = @device.positions.create device_position_params
    else  
      @position = @device.positions.last
      puts "LAST POSITION before: #{@position}"
      last_position = @position.update_attributes(device_position_params)
      last_position = @position
      puts "LAST POSITION after: #{@position}"
    end  
      
    render json: last_position
  end
  
  private
  
    def device_params
      params[:device].delete(:connect)
      params.require(:device).permit(:model, :uiid, :os, :connected)
    end
  
    def device_position_params
      params.require(:device_position).permit(:device_id, :lat, :lng)
    end
  
    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end

  end
end
