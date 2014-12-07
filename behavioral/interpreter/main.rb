require './calculation'

class Calculator
  def self.parse(input)
    stack = []
   
    input.lstrip!
    while input.length > 0
      case input
        when /\A-?\d+(\.\d+)?/
          stack << Calculation::Number.new($&.to_i)
        else
          second, first = stack.pop(), stack.pop()
   
          case input
            when /\A\+/
              stack << Calculation::Plus.new(first, second)
            when /\A\-/
              stack << Calculation::Minus.new(first, second)
            when /\A\*/
              stack << Calculation::Multiply.new(first, second)
          else
            raise 'Token unknown'
          end
      end
   
      input = $'
      input.lstrip!
    end
   
    raise 'Syntax error' unless stack.size == 1
   
    stack.first.execute
  end
end

puts Calculator.parse('4 5 2 + *')