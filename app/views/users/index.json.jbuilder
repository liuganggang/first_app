json.array!(@users) do |user|
  json.extract! user, :name, :emall
  json.url user_url(user, format: :json)
end