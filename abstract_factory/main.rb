require './txt_factory'
require './pdf_factory'
require './doc_factory'

# abstract factory class
class FilesFactory  
  def initialize factory 
    klass = Object.const_get(factory.capitalize + 'Factory')
    file  = klass.create  
    file.write  
  end
end  

# abstract factory usage  
AbstractFilesFactory.new 'txt'  
AbstractFilesFactory.new 'pdf'  
AbstractFilesFactory.new 'doc'  