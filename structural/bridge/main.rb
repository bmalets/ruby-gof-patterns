class Abstraction
  def initialize(implementor)
    @implementor = implementor
  end
 
  def operation
    raise 'Implementor object does not respond to the operation method' unless @implementor.respond_to?(:operation)
    @implementor.operation
  end
end
 
class RefinedAbstraction < Abstraction
  def operation
    puts 'Starting operation... '
    super
  end
end
 
class Implementor
  def operation
    puts 'Doing necessary stuff'
  end
end
 
class ConcreteImplementorA < Implementor
  def operation
    super
    puts 'Doing additional stuff'
  end
end
 
class ConcreteImplementorB < Implementor
  def operation
    super
    puts 'Doing other additional stuff'
  end
end
 
normal_with_a = Abstraction.new(ConcreteImplementorA.new)
normal_with_a.operation
# Doing necessary stuff
# Doing additional stuff
 
normal_with_b = Abstraction.new(ConcreteImplementorB.new)
normal_with_b.operation
# Doing necessary stuff
# Doing other additional stuff
 
refined_with_a = RefinedAbstraction.new(ConcreteImplementorA.new)
refined_with_a.operation
# Starting operation...
# Doing necessary stuff
# Doing additional stuff
 
refined_with_b = RefinedAbstraction.new(ConcreteImplementorB.new)
refined_with_b.operation
# Starting operation...
# Doing necessary stuff
# Doing other additional stuff