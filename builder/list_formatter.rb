class ListFormatter < Fatty::Formatter  
  format :text do  
    def render  
      params[:data].map { |e| "* #{e}" }.join("\n")  
    end  
  end  
  
  format :html do  
    def render  
      list_elements = params[:data].map { |e| "<li>#{e}</li>" }.join  
      "<ul>#{list_elements}</ul>"  
    end  
  end  
end 