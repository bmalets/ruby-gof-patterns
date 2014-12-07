module Calculation

  class Number
    def initialize(value)
      @value = value
    end
   
    def execute
      @value
    end
  end
   
  class Plus
    def initialize(left, right)
      @left = left
      @right = right
    end
   
    def execute
      @left.execute + @right.execute
    end
  end
   
  class Minus
    def initialize(left, right)
      @left = left
      @right = right
    end
   
    def execute
      @left.execute - @right.execute
    end
  end
   
  class Multiply
    def initialize(left, right)
      @left = left
      @right = right
    end
   
    def execute
      @left.execute * @right.execute
    end
  end

end