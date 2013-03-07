require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'json'
require 'httpclient'

get '/' do
  @foo = HTTPClient.get('https://rubygems.org/api/v1/activity/just_updated.json')
  @gems = JSON.parse(@foo.body)
  erb(:recent)
end

# done, stack is cedar
# http://latest-gems.herokuapp.com/ | git@heroku.com:latest-gems.git
