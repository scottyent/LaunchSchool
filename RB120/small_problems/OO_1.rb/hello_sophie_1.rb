#  add a parameter to #initialize that provides a name for the Cat object.
# Use an instance variable to print a greeting with the provided name.
# (You can remove the code that displays I'm a cat!.)

class Cat
  attr_accessor :name

  def initialize(name)
    self.name = name
    puts "Hi there #{@name}!"
  end
end

kitty = Cat.new('Sophie')