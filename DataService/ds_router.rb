#ds-router.rb
require 'rubygems'
require 'sinatra'
require 'json'

#Example paths:
# Data Services:
# http(s):[Domain]/[Schema]/[Entity]/[ID]
# CRUD handled by verbs
# http(s):[Domain]/[Schema]/[Entity]?{filter}
#http(s):[Domain]/[Schema]/[Entity]/Method


=begin
get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params[:name] is 'foo' or 'bar'
  "Hello #{params[:name]}!"
end

=end

get '/hello/:name', :provides => :json do
  pass unless request.accept? 'application/json'
  "Hello #{params[:name]} in jSON"
end

get '/hello/:name', :provides => :xml do
  pass unless request.accept? 'application/xml'
  "Hello #{params[:name]} in XML!"
end