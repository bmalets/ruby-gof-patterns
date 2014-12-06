class Bike
  def self.factory brand
    {ghost: Ghost, cannondale: Cannondale}[brand].new
  end
end

class Ghost < Bike
  def website
    puts "http://www.ghost-bikes.com/"
  end
end

class Cannondale < Bike
  def website
    puts "http://www.cannondale.com/"
  end  
end

# factory method example
bike = Bike.factory(:ghost)
bike.website

bike = Bike.factory(:cannondale)
bike.website
