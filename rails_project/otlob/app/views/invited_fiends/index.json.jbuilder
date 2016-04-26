json.array!(@invited_fiends) do |invited_fiend|
  json.extract! invited_fiend, :id, :status
  json.url invited_fiend_url(invited_fiend, format: :json)
end
