# myapp.rb
require 'rubygems'
require 'sinatra'
require 'json'

# load required ruby
require './ds_model'
require './ds_router'

get '/' do
  'Hello world!'
end

get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params[:name] is 'foo' or 'bar'
  "Hello #{params[:name]}!"
end