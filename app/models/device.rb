class Device < ActiveRecord::Base

  has_many :positions, class_name: "DevicePosition", 
                       foreign_key: "device_id", :dependent => :destroy
  
end
