require './fatty_formatter'
require './list_formatter'

data = %w[foo bar baz]  
[:html, :text].each do |format|  
  puts ListFormatter.render(format, :data => data)  
end  