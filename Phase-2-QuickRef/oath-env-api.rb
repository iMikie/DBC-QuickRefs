#in gemfile
require 'twitter'
require 'dotenv'
Dotenv.load

add.env in.gitignore


require 'twitter'
require 'pry'
#put this in helpers/twitter.rb
def tweet(t)
  client = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV['CONSUMER_KEY']
    config.consumer_secret = ENV['CONSUMER_SECRET']
    config.access_token = ENV['ACCESS_TOKEN']
    config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
  end
  client.update(t)
end