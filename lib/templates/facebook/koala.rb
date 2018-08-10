Koala.configure do |config|
  config.app_id = ENV['FACEBOOK_APP_ID']
  config.app_secret = ENV['FACEBOOK_SECRET']
  # config.app_access_token = 'MY_APP_ACCESS_TOKEN' used to get app own access token for certain
  # requests without user session
  # See Koala::Configuration for more options, including details on how to send requests through
  # your own proxy servers.
end
