module TxtFactory  
  extend self  
    
  def create  
    TxtFile.new  
  end  
  
  class TxtFile  
    def write  
      puts "I'm .txt file"  
    end  
  end  
end 