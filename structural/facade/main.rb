# without facade
=begin
  require 'net/http'  
  require 'uri'  
    
  url = URI.parse('http://www.google.com')  
  res = Net::HTTP.start(url.host, url.port) {|http|  http.get('/index.html')  }  
    
  puts res.body 
=end

# with facade
require "open-uri"  
puts open("http://www.google.com").read 