class WebManager
  include Chainable

  def initialize(link = nil)
    next_in_chain(link)
  end
 
  def deliver_application
    design_interface
    build_application
    write_documentation
    deploy_application
    puts "#{self.class.to_s}: Application delivered"
  end

end

class WebDeveloper
  include Chainable

  def initialize(link = nil)
    next_in_chain(link)
  end

  def build_application
    puts "#{self.class.to_s}: I'm building the application"
  end

  def deploy_application
    puts "#{self.class.to_s}: I'm deploying the application"
  end

end

class WebDesigner
  include Chainable

  def initialize(link = nil)
    next_in_chain(link)
  end

  def design_interface
    puts "#{self.class.to_s}: I'm designing the interface"
  end

end


provider = WebManager.new( WebDeveloper.new( WebDesigner.new ) )
provider.deliver_application
provider.make_support