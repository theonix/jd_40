json.array!(@lives) do |life|
  json.extract! life, 
  json.url life_url(life, format: :json)
end
