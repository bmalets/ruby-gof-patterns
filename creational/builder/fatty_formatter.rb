module Fatty  
  class Formatter  
      
    class << self      
      def formats  
        @formats ||= {}  
      end  
      
      def format(name, options={}, &block)  
        formats[name] = Class.new(Fatty::Format, &block)  
      end  
          
      def render(format, params={})          
        format_obj = formats[format].new  
        format_obj.params = params  
        format_obj.render  
      end     
    end  
  end  
    
  class Format  
    attr_accessor :params   
  end  
end  