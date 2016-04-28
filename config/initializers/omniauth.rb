Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["292548061885-usfmboop8ioneq55j5n1j89sfs4ac3fu.apps.googleusercontent.com"], ENV["G51sElgzfgyl-RRY4UVeJGwm"]
end