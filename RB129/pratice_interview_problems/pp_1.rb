class Person
  attr_reader :name

  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name

# What is output and why? What does this demonstrate about instance variables
# that differentiates them from local variables?

# This will output `nil`. This demonstrates that unlike local variables, instance
# variables do not need to be initialized to be referenced. They will not give
#   you an error, they will simply always return `nil`.