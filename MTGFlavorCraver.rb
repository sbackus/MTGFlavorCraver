require "twitter"

# https://apps.twitter.com/app/7845439
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["FLAVORCRAVER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["FLAVORCRAVER_CONSUMER_SECRET"]
  config.access_token        = ENV["FLAVORCRAVER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["FLAVORCRAVER_ACCESS_TOKEN_SECRET"]
end

client.update("\"But once, with a magician's help, Time was stopped and Day stood still.\"
—Love Song of Night and Day")
