json.array!(@reviews) do |review|
  json.extract! review, :id, :business_id, :user_id, :rating, :content
  json.url review_url(review, format: :json)
end
