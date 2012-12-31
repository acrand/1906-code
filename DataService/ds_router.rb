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
set :protection, :origin_whitelist => ['http://localhost:8888']
  
#Important! - prevents cross domain issues.
configure do
  enable :cross_origin
end


get '/hello/:name', :provides => :json do
  pass unless request.accept? 'application/json'
#  showDetails
  ServiceLogger.log(LOG_INFO, __method__, "Hello #{params[:name]} in jSON - GET".to_s)
  "Hello #{params[:name]} in jSON - GET".to_json
end

post '/hello/:name', :provides => :json do
  pass unless request.accept? 'application/json'
#  showDetails
  ServiceLogger.log(LOG_INFO, __method__, "Hello #{params[:name]} in jSON - POST".to_json.to_s)
  "Hello #{params[:name]} in jSON - POST".to_json

end

put '/hello/:name', :provides => :json do
  pass unless request.accept? 'application/json'
#  showDetails
  ServiceLogger.log(LOG_INFO, __method__, "Hello #{params[:name]} in jSON - PUT".to_json.to_s)
  "Hello #{params[:name]} in jSON - PUT".to_json

end

delete '/hello/:name', :provides => :json do
  pass unless request.accept? 'application/json'
#  showDetails
  ServiceLogger.log(LOG_INFO, __method__, "Hello #{params[:name]} in jSON - delete".to_s)
  "Hello #{params[:name]} in jSON - delete".to_json

end

get '/hello/:name', :provides => :xml do
  pass unless request.accept? 'application/xml'
#  showDetails
  ServiceLogger.log(LOG_INFO, __method__, "Hello #{params[:name]} in XML!".to_s)
  "Hello #{params[:name]} in XML!".to_xml
end


def showDetails
  puts request.accept               # ['text/html', '*/*']
  puts request.preferred_type  # 'text/html'
  puts request.body                # request body sent by the client (see below)
  puts request.scheme              # "http"
  puts request.script_name         # "/example"
  puts  request.path_info           # "/foo"
  puts request.port                # 80
  puts request.request_method      # "GET"
  puts request.query_string        # ""
  puts request.content_length      # length of request.body
  puts request.media_type          # media type of request.body
  puts request.host                # "example.com"
  #request["SOME_HEADER"]      # value of SOME_HEADER header
  puts request.referrer            # the referrer of the client or '/'
  puts request.user_agent          # user agent (used by :agent condition)
  puts request.cookies             # hash of browser cookies
  #request.xhr?                # is this an ajax request?
  puts request.url                 # "http://example.com/example/foo"
  puts request.path                # "/example/foo"
  puts request.ip                  # client IP address
end