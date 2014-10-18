json.array!(@boroughs) do |borough|
  json.extract! borough, :id, :name
  json.url borough_url(borough, format: :json)
end
