require './originator'

class Example
    include Originator
    attr_accessor :name, :color

    def initialize name, color
        @name = name
        @color = color
    end
end

if __FILE__ == $0
    ex = Example.new "Matt", "blue"
    puts "my name is #{ex.name}"
    ex.save :now
    ex.name = "John"
    puts "my name is #{ex.name}"
    ex.save :later

    ex.restore :now
    puts "my name is #{ex.name}"
    ex.restore :later
    puts "my name is #{ex.name}"
end
