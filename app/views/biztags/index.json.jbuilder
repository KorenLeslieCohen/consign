json.array!(@biztags) do |biztag|
  json.extract! biztag, :id, :name
  json.url biztag_url(biztag, format: :json)
end
