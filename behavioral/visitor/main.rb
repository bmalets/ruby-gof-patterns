class Node
  def accept visitor
    raise NotImpelementedError.new
  end
end

module Visitable
  def accept visitor
    visitor.visit self
  end
end

class IntegerNode < Node
  include Visitable

  attr_reader :value
  def initialize value
    @value = value
  end
end

class Ast < Node
  def initialize
    @nodes = []
    @nodes << IntegerNode.new(2)
    @nodes << IntegerNode.new(3)
  end

  def accept visitor
    @nodes.each do |node|
      node.accept visitor
    end
  end
end

class DoublerVisitor
  def visit subject
    puts subject.value * 2
  end
end

class TriplerVisitor
  def visit subject
    puts subject.value * 3
  end
end

ast = Ast.new
puts "Doubler:"
ast.accept DoublerVisitor.new
puts "Tripler:"
ast.accept TriplerVisitor.new
