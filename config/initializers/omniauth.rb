Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['123105411427139'], ENV['da50f1bb8c30e1d40b641e583d605038'],
           :scope => 'email,user_birthday,read_stream,picture,name', :display => 'popup'
end

