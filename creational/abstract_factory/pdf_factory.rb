module PdfFactory  
  extend self  
    
  def create  
    PdfFile.new  
  end  
  
  class PdfFile  
    def write  
      puts "I'm .pdf file"  
    end  
  end  
end 