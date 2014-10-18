json.array!(@photos) do |photo|
  json.extract! photo, :id, :business_id, :user_id
  json.url photo_url(photo, format: :json)
end
