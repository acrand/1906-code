# main.rb required gems
require 'rubygems'
require 'sinatra'
require 'sinatra/cross_origin'
require 'json'
require 'mongo' 
require 'uri'
require 'cgi'
require 'json'

# load required App Helper scripts
require '../AppHelpers/logger'
require '../AppHelpers/router'

# load required service scripts
require './ds_service'
require './ds_router'

#Any helper methods used by this App
helpers do
  
    
end
