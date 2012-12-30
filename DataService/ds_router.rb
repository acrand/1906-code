#ds-router.rb
require 'rubygems'
require 'sinatra'
require 'sinatra/cross_origin' #Important! - prevents cross domain issues.

require 'json'
require 'rest_client'

include ServiceLogger
#include Router

#Example paths:
# Data Services:
# http(s):[Domain]/[UID]/[Namespace]/[Entity]/{attributes}
# CRUD handled by verbs
# http(s):[Domain]/[UID]/[Namespace]/[Entity]/{attributes}?{filter}
# http(s):[Domain]/[UID]/[Namespace]/[Entity]/{attributes}/Method?

set :allow_methods, [:get, :delete, :post, :put, :options]

#Important! - prevents cross domain issues.
configure do
  enable :cross_origin
end


get '/hello/:name', :provides => :json do
  pass unless request.accept? 'application/json'
  ServiceLogger.log(LOG_INFO, __method__, "Hello #{params[:name]} in jSON - GET".to_s)
  "Hello #{params[:name]} in jSON - GET".to_json
end

post '/hello/:name', :provides => :json do
  pass unless request.accept? 'application/json'
  "Hello #{params[:name]} in jSON - POST".to_json
#  ServiceLogger.log(LOG_INFO, __method__, "Hello #{params[:name]} in jSON - POST".to_json.to_s)
end

delete '/hello/:name', :provides => :json do
pass unless request.accept? 'application/json'
  "Hello #{params[:name]} in jSON - delete".to_json
#  ServiceLogger.log(LOG_INFO, __method__, "Hello #{params[:name]} in jSON - delete".to_s)
end

get '/hello/:name', :provides => :xml do
  pass unless request.accept? 'application/xml'
  "Hello #{params[:name]} in XML!".to_xml
#  ServiceLogger.log(LOG_INFO, __method__, "Hello #{params[:name]} in XML!".to_s)
end