Rainmaker.configure do |config|
  config.api_key = ENV['RAINMAKER_KEY']
  config.timeout_seconds = "30"  # value will be used for all requests unless overridden
  config.twitter_token = "#{ENV['RAINMAKER_TT_KEY']}&ts=#{ENV['RAINMAKER_TS_KEY']}" 
  config.linkedin_token = "#{ENV['RAINMAKER_LT_KEY']}&ls=#{ENV['RAINMAKER_LS_KEY']}"
end