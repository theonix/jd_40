json.array!(@device_positions) do |device_position|
  json.extract! device_position, :id, :lat, :lng    
end
