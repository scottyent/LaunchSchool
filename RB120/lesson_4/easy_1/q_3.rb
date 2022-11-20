# In the last question we had a module called Speed which contained a
# go_fast method. We included this module in the Car class as shown below.

# When we called the go_fast method from an instance of the Car class
# (as shown below) you might have noticed that the string printed when
# we go fast includes the name of the type of vehicle we are using.
# How is this done?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

# >> small_car = Car.new
# >> small_car.go_fast
# I am a Car and going super fast!

# This is done by using self.class inside the module. Self resolves to the
# object itself, and class returns the class name of the object. So when it's
# called for a car it resolves to car object -> class, which is Car. and puts
# that in the text.

# Correct