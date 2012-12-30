require 'uri'

module Router
  
  class Request
     attr_accessor :scheme
     attr_accessor :host
     attr_accessor :path
     attr_accessor :query
     attr_accessor :fragment
     attr_accessor :entity
     attr_accessor :schema
     
     def initialize(data)
       Logger.log(LOG_INFO, __method__, data)

       uri = URI.parse(data)
       
       @scheme = uri.scheme
       @host = uri.host
       @path = uri.path
       @query = uri.query
       @fragment = uri.fragment
       
       @entity = uri.path[1..-1]
       
       @schema = uri.path[1..-1]
     end        
  end
  
  #initialize data service with URI 
  def self.initUri(data)
     Logger.log(LOG_INFO, __method__, data)

     clienturi = URI.parse(data)
     
     #puts uri.scheme
     #puts uri.host
     #puts uri.path
     #puts uri.query
     #puts uri.fragment
     #puts uri.to_s

     #self.createCollection(clienturi.path[1..-1]) 
     
     #self.createDocument(clienturi.query)
     
     #self.parseQuery(clienturi.query)

            
  end

end