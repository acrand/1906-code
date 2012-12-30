#ds-router.rb
require 'rubygems'
require 'sinatra'
require 'json'
require 'rest_client'

#Example paths:
# Data Services:
# http(s):[Domain]/[UID]/[Namespace]/[Entity]/{attributes}
# CRUD handled by verbs
# http(s):[Domain]/[UID]/[Namespace]/[Entity]/{attributes}?{filter}
# http(s):[Domain]/[UID]/[Namespace]/[Entity]/{attributes}/Method?


=begin
get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params[:name] is 'foo' or 'bar'
  "Hello #{params[:name]}!"
end

=end

get '/hello/:name', :provides => :json do
  pass unless request.accept? 'application/json'
  "Hello #{params[:name]} in jSON - GET".to_json
end

post '/hello/:name', :provides => :json do
  pass unless request.accept? 'application/json'
  "Hello #{params[:name]} in jSON - POST".to_json
end


get '/hello/:name', :provides => :xml do
  pass unless request.accept? 'application/xml'
  "Hello #{params[:name]} in XML!"
end