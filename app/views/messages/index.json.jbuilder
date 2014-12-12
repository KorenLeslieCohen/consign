json.array!(@messages) do |message|
  json.extract! message, :id, :name, :email, :body
  json.url message_url(message, format: :json)
end
