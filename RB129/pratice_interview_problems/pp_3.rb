module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end

  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides
p Square.new.sides
p Square.new.describe_shape

# What is output and why? What does this demonstrate about constant scope?
# What does `self` refer to in each of the 3 methods above?

# It will output
# 4
# 4
# Error because it can't access a constant with the neame SIDES

# This shows that constants have lexical scope, and then traverse up the method
# lookup path from the reference of the constant, to locate a potential match.
# However, they can't traverse down the method lookup path, so in the third
# example there, it has reached the appropriate method but all references to
# the constant are in the lower portion of the method lookup path, so as far
# as that method is concerned, SIDES is uninitialized