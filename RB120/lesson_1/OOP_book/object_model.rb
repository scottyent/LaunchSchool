# How do we create an object in Ruby? Give an example of the creation of an object.
# we create a new object using the new keyword, for example with a hash:
Freqencies = Hash.new

# What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.
# A module is a more broadly used behavior that you can mixin to classes wherever you want to use them. Exercise 1 didn't ask to create a class, so I guess I'll do it here:

module Drive
  def drive(sound)
    puts sound
  end
end

class Car
  include Drive
end

tesla = Car.new
tesla.drive("spaceship noises!")

mercedes = Car.new
mercedes.drive("Vroom vroom")



