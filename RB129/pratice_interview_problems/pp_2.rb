module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim

# What is output and why? What does this demonstrate about instance variables?

# The output is nil, which shows you that instance variables can be referenced
# before they are initialized, but they will simply have the value of nil. So
# in this case, it will not print swimming because @can_swim is equal to nil and
#   so evaluates to false.