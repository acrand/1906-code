require 'rubygems'
require 'sinatra' 
require './main'

enable :logging
set :environment, :production
set :port, 4567
run Sinatra::Application
