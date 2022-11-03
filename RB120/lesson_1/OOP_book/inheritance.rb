# module Walkable
#   def walk
#     "I'm walking."
#   end
# end

# module Swimmable
#   def swim
#     "I'm swimming"
#   end
# end

# module Climbale
#   def climb
#     "I'm climbing"
#   end
# end

# class Animal
#   include Walkable

#   def speak
#     "I'm an animal, and I speak!"
#   end
# end

# class GoodDog < Animal
#   include Swimmable
#   include Climbale
# end

# puts "---GoodDog method lookup---"
# puts GoodDog.ancestors
# fido = Animal.new

# puts fido.speak
# puts fido.walk

# module Mammal
# 	class Dog
# 		def speak(sound)
# 			p "#{sound}"
# 		end
# 	end

# 	class Cat
# 		def say_name(name)
# 			p "#{name}"
# 		end
# 	end
# end

# buddy = Mammal::Dog.new
# kitty = Mammal::Cat.new
# buddy.speak("Arf!")
# kitty.say_name('kitty')

# Exercises
# 1
=begin
Create a superclass called Vehicle for your MyCar class to inherit from
and move the behavior that isn't specific to the MyCar class to the superclass. :DONE
- I moved over the functinos of speeding up, slowing down, current speed, turning the car off
and spray paint.

Create a constant in your MyCar class that stores information about the
vehicle that makes it different from other types of Vehicles.
- I'm not really sure what this means. I guess something to differentiate
the car from the truck for example. It has to be a constant too, so it doesn't change.
I guess I'll just say body_type = sedan?

Then create a new class called MyTruck that inherits from your
superclass that also has a constant defined that separates it from
the MyCar class in some way.

# 2
Add a class variable to your superclass that can keep track of the number
of objects created that inherit from the superclass.
Create a method to print out the value of this class variable as well. :DONE
Also refactored the first answer to include all initialization in the superclass instead

# 3
Create a module that you can mix in to ONE of your subclasses that describes
a behavior unique to that subclass.
... tough one - I want to say chargeable, but technically a truck or a car could charge, so
that could be in the superclass. How about... towable?

# 4
Print to the screen your method lookup for the classes that you have created.
 - Pretty straight forward, juse use ancestors for each class
=end

module Towable
  def tow
    @towing = true
  end
end

class Vehicle
  attr_accessor :year, :color, :model, :speed

  @@vehicle_count = 0

  def initialize(y, c, m)
    self.year = y
    self.color = c
    self.model = m
    self.speed = 0
    @@vehicle_count += 1
  end

  def self.how_many_vehicles
    "#{@@vehicle_count} vehicles have been created"
  end

  def speed_up(number)
    self.speed += number
    "You push the accelerator and speed up #{number} MPH"
  end

  def brake(number)
    self.speed -= number
    "You push the break and slow down #{number} MPH"
  end

  def current_speed
    "You are currently driving #{speed} MPH"
  end

  def turn_off
    self.speed = 0
    "You are now parked!"
  end

  def gas_mileage(gallons, miles)
    "#{miles / gallons} miles per gallon of gas"
  end

  def spray_paint(color)
    self.color = color
    "Sweet upgrade! You now have a very #{color}"
  end
end

class MyCar < Vehicle
  BODY_TYPE = "sedan"

  def spray_paint(color)
    super + " car"
  end

  def to_s
    "This is a cool #{color} #{model} from #{year}"
  end
end

class MyTruck < Vehicle
  BODY_TYPE = "truck"
  attr_accessor :towing
  include Towable

  def spray_paint(color)
    super + " truck"
  end
end

# puts Vehicle.how_many_vehicles

# eve = MyCar.new(2021, "white", "Tesla")
# tonka = MyTruck.new(2022, "orange", "Ford")

# puts eve.gas_mileage(12, 500)
# puts tonka.gas_mileage(10, 100)

# eve.speed_up(10)
# puts eve.current_speed

# puts eve.inspect
# puts tonka.inspect
# puts tonka.tow # Ok this works, but I'm not sure how to initialize this to false.

# puts Vehicle.how_many_vehicles


# puts "---Vehicle Method Lookup---"
# puts Vehicle.ancestors
# puts "---MyCar Method Lookup---"
# puts MyCar.ancestors
# puts "---MyTruck Method Lookup---"
# puts MyTruck.ancestors