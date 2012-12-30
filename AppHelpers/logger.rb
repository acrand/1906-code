module Logger 
  
  LOG_DEBUG = 000
  LOG_ERROR = 250
  LOG_WARNING = 500
  LOG_INFO = 750
  LOG_NONE = 999
  
  SERVICE_NAME = self.name
  LOG_LEVEL = LOG_NONE
  
  def self.log(level, method, data)

     if level.to_i >= LOG_LEVEL 
       @@log ||= File.open("ds_log.txt", "a")
       puts "##Log::" +Time.now.to_s  + "::" + SERVICE_NAME + "::"+ method.to_s + "::"+ data +""
       @@log.puts "##Log::" +Time.now.to_s  + "::" + SERVICE_NAME + "::"+ method.to_s + "::"+ data +""
     end          
  end
    
end