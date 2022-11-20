# If we have a Car class and a Truck class and we want to be able to go_fast,
# how can we add the ability for them to go_fast using the module Speed?
# How can you check if your Car or Truck can now go fast?

# Answer: include the module in the classes. Or, we could even be fancy
# and instead of writing include twice, just make a Vehicle super class and
# include it there. I'll try both ways.

# Both worked!

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Vehicle
  include Speed
end

class Car < Vehicle
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck < Vehicle
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

tonka = Truck.new
sedan = Car.new

tonka.go_fast
sedan.go_fast