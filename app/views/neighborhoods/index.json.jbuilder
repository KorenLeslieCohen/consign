json.array!(@neighborhoods) do |neighborhood|
  json.extract! neighborhood, :id, :name, :borough_id
  json.url neighborhood_url(neighborhood, format: :json)
end
