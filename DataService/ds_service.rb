#require gems
require 'mongo'
require 'uri'
require 'cgi'
require 'json'
require '../AppHelpers/logger'

include ServiceLogger
  
  
#Module for Data Service web service
module DataService 
  
  #include modules
  include Mongo
  
  #set logger properties
  ServiceLogger::LOG_LEVEL = ServiceLogger::LOG_DEBUG 
  ServiceLogger::SERVICE_NAME = "Data Service"
  
  #TODO move to config yml of config loop - static variables 
  @client = MongoClient.new('localhost', 27017)
  @db = @client['hoarddata-db']

=begin
  #initialize data service with URI 
  def self.init(schema, entity,  data)
     Logger.log(LOG_INFO, __method__, data)

     #uri = URI.parse(data)
     #puts uri.scheme
     #puts uri.host
     #puts uri.path
     #puts uri.query
     #puts uri.fragment
     #puts uri.to_s

     self.createCollection(entity) 
     
     self.createDocument(data)
     
     self.parseQuery(data)

            
  end
=end
  #initialize data service with URI 
  def self.initialize(request)
    ServiceLogger.log(LOG_INFO, __method__, request.to_s)

     self.createCollection(request.entity) 
     
     self.createDocument(request.query)
     
     self.parseQuery(request.query)
            
  end
  
=begin    
  #initialize data service with URI 
  def self.init(data)
     Logger.log(LOG_INFO, __method__, data)

     uri = URI.parse(data)
     
     #puts uri.scheme
     #puts uri.host
     #puts uri.path
     #puts uri.query
     #puts uri.fragment
     #puts uri.to_s

     self.createCollection(uri.path[1..-1]) 
     
     self.createDocument(uri.query)
     
     self.parseQuery(uri.query)

            
  end
=end
 
  def self.parseQuery(query)
     
    ServiceLogger.log(LOG_INFO, __method__, query)
     
     CGI::parse(query).each do |key , value|
        #puts key + " - " + value[0]  
        ServiceLogger.log(LOG_DEBUG, __method__, key + " - " + value[0])   
     end   
  end
  
  def self.createCollection(name)
    ServiceLogger.log(LOG_INFO, __method__, name)
    
    @collection = @db[name]
    
  end
  
  def self.dropCollection(name)
    ServiceLogger.log(LOG_INFO, __method__, name)
    
    @collection = @db[name]
    @collection.drop
    
  end
  
  def self.collectionExist(name)
    ServiceLogger.log(LOG_INFO, __method__, name)
    #TODO iterate collwctions    
    
  end
  
  def self.createDocument(attributes)
    ServiceLogger.log(LOG_INFO, __method__, name)
    
    @collection.insert(CGI::parse(attributes))
  end
  
end

=begin
#Start**********TODO remove this is for UNit test only ****************
require '../AppHelpers/router'
include Router

#initialize Router Request
request  = Router::Request.new('http://localhost:4567/cars?name=honda&color=blue')

#initialize DataService module 
DataService.initialize(request)

#End**********TODO remove this is for UNit test only ****************


# http(s):[Domain]
#/datasevice/[Entity]/[ID]
post 'dataservice/:path', :provides => :json do
   


end
=end