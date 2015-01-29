require "twitter"
require 'json'

# https://apps.twitter.com/app/7845439
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["FLAVORCRAVER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["FLAVORCRAVER_CONSUMER_SECRET"]
  config.access_token        = ENV["FLAVORCRAVER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["FLAVORCRAVER_ACCESS_TOKEN_SECRET"]
end

file = File.read('AllSets.json')
all_sets = JSON.parse(file)


number_of_sets = all_sets.keys.length
random_set = all_sets.keys[rand(0...number_of_sets)]
set = all_sets[random_set]["cards"]
puts random_set
puts set.length

number_of_cards_in_set = set.length
card = set[rand(0...number_of_cards_in_set)]
flavor = card["flavor"]
puts flavor
if flavor && flavor.length < 140
  client.update(flavor)
end

