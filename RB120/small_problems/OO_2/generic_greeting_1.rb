# Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

kitty = Cat.new

Cat.generic_greeting
kitty.class.generic_greeting

# This will print Hello! I'm a cat! Because kitty.class resolves to Cat, and then it calls generic_greeting on it

puts kitty.class