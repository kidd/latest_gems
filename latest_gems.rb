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

helpers do
  def link_to_gem(gem)
    "<a href='http://rubygems.org/gems/#{gem["name"]}'> #{gem["name"]}</a>"
  end
end
