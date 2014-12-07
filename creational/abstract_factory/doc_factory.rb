module DocFactory  
  extend self  
    
  def create  
    DocFile.new  
  end  
  
  class DocFile  
    def write  
      puts "I'm .doc file"  
    end  
  end  
end 