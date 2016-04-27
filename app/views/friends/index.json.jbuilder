json.array!(@friends) do |friend|
  json.extract! friend, :id, :friend_id
  json.url friend_url(friend, format: :json)
end
