class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")
p bruno

# What is output and why? What does this demonstrate about `super`?

# This will output an object that has attributes of name, and color
# both with the value of brown. The reason for this is that when super is called
# without parentheses, or explicitly passing in certain values, it will pass all
# values to the method higher up in the hierarchical chain.