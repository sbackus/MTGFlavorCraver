#!/usr/bin/env ruby
require 'twitter'
require 'json'

# https://apps.twitter.com/app/7845439
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["FLAVORCRAVER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["FLAVORCRAVER_CONSUMER_SECRET"]
  config.access_token        = ENV["FLAVORCRAVER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["FLAVORCRAVER_ACCESS_TOKEN_SECRET"]
end

def random_flavor
  file = File.read('/Users/sbackus/Code/MTGFlavorCraver/AllSets.json')
  all_sets = JSON.parse(file)

  number_of_sets = all_sets.keys.length
  random_set = all_sets.keys[rand(0...number_of_sets)]
  set = all_sets[random_set]["cards"]
  puts random_set
  puts set.length

  number_of_cards_in_set = set.length
  card = set[rand(0...number_of_cards_in_set)]
  puts card["name"]
  flavor = card["flavor"]
  puts flavor
  return flavor
end

flavor = nil

until  flavor && flavor.length < 140 do
  flavor = random_flavor
end

client.update(flavor)