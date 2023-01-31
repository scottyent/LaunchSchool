class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end

# What is output and why? How does this code demonstrate polymorphism?

# This is demonstrating polymorphism by inheritance and method overriding.
# Within the feed_animal method, we're able to call the `#eat` method knowing
# that any animal will have inherited an eat function. Using overriding, we're
# also able to make sure that each subclass reacts appropriately to the call and
# has a different behavior.

# So this will output I eat, I eat plankton, I eat kibble