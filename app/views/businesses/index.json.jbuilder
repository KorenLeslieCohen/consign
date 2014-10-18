json.array!(@businesses) do |business|
  json.extract! business, :id, :user_id, :neighborhood_id, :borough_id, :name, :address, :hours, :email, :terms
  json.url business_url(business, format: :json)
end
