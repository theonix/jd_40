require 'spec_helper'
require 'factory_girl_rails'

describe Api::V1::DevicesController do

  describe "GET 'last_positions'" do
    it "returns http success" do
      get 'last_positions'
      response.should be_success
    end
  end

  describe "POST 'save_position'" do
    it "creates a new record per position if save_all_positions = true" do
      
      device = FactoryGirl.create :device, model: "Jesus", os: "Android"
      
      params = {device_id: device.id, save_all_positions: true, device_position: {device_id: device.id, lat: 1.5, lng: 1.5}}      
      post 'save_position', params, { "Accept" => "application/json" }

      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      
      puts "BODY 1 #{body}"
      
      params = {device_id: device.id, save_all_positions: true, device_position: {device_id: device.id, lat: 2.5, lng: 2.5}}
      post 'save_position', params, { "Accept" => "application/json" }
      
      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      
      puts "BODY 2 #{body}"
           
    end
    
    it "mantains only one record per device & position if save_all_positions = false" do
      
      device = FactoryGirl.create :device, model: "Jesus", os: "Android"
      
      params = {device_id: device.id, save_all_positions: false, device_position: {device_id: device.id, lat: 1.5, lng: 1.5}}      
      post 'save_position', params, { "Accept" => "application/json" }

      expect(response.status).to eq 200
      body1 = JSON.parse(response.body)
      
      puts "BODY 1 #{body1}"
      
      params = {device_id: device.id, save_all_positions: false, device_position: {device_id: device.id, lat: 2.5, lng: 2.5}}
      post 'save_position', params, { "Accept" => "application/json" }
      
      expect(response.status).to eq 200
      body2 = JSON.parse(response.body)
      
      puts "BODY 2 #{body2}"
      
      expect(body2[:id]).to eq body1[:id]
      expect(body1["lat"]).to eq 1.5
      expect(body2["lat"]).to eq 2.5
      
    end

  
  end
   
  describe "GET /devices" do
    it "returns all the devices" do
      FactoryGirl.create :device, model: "Jesus", os: "Android"
      FactoryGirl.create :device, model: "Jose", os: "Android"
      FactoryGirl.create :device, model: "Benja", os: "Android"

      get 'index', {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      devices_names = body.map { |d| d["model"] }

      expect(devices_names).to match_array(["Jesus", "Jose", "Benja"])
    end
  end
  
end