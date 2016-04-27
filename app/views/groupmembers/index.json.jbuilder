json.array!(@groupmembers) do |groupmember|
  json.extract! groupmember, :id
  json.url groupmember_url(groupmember, format: :json)
end
