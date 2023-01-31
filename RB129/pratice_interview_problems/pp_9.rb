class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")

# What is output and why? What does this demonstrate about `super`?


# This will give you a ArgumentError, because similar to the last
# problem, super will pass all arguments upwards unless explicitly told
# not to. In this instance, we could do super() to call the method above. However
#   the way it is written, it will pass the string "black" to the initialize
#   method in the Animal class, and that does not take any arguments so will
#   trigger the error.