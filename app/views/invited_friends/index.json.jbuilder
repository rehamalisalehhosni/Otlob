json.array!(@invited_friends) do |invited_friend|
  json.extract! invited_friend, :id, :status
  json.url invited_friend_url(invited_friend, format: :json)
end
