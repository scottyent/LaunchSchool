# Class methods

# class GoodDog
#   DOG_YEARS = 7
#   @@number_of_dogs = 0

#   attr_accessor :name, :age

#   def self.what_am_i
#     "I'm a GoodDog class!"
#   end

# 	def initialize(n, a)
# 		self.name = n
#     self.age = a * DOG_YEARS
#     @@number_of_dogs +=1
# 	end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end

#   def speak
#     "#{name} says arf!"
#   end

#   def change_info(n, a)
#     self.name = n
#     self.age = a
#   end

#   def to_s
#     "The dogs name is #{name} and it is #{age} in dog years."
#   end
# end

# fido = GoodDog.new("Fido", 5)
# puts fido.inspect

# Investigating self

# class GoodDog
#   attr_accessor :name, :height, :weight

#   puts self

#   def initialize(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall"
#   end

#   def what_is_self
#     self
#   end
# end

# Exercises
#1: Add a class method to your MyCar class that calculates the gas mileage of any car.
# I really overthought this one and added instance variabels to track a specific cars distance and tank size
# the answer is way more basic:

# class MyCar
#   def self.gas_mileage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end
# end

# MyCar.gas_mileage(13, 351)  # => "27 miles per gallon of gas"

# class MyCar
#   attr_accessor :color, :model, :speed, :distance, :tank_size
#   attr_reader :year

#   def initialize(y, c, m, d, t)
#     @year = y
#     self.color = c
#     self.model = m
#     self.distance = 240
#     self.tank_size = 12
#     self.speed = 0
#   end

#   def self.calculate_mileage(car_object)
#     puts "The mileage of this car is #{car_object.distance/car_object.tank_size}"
#   end

#   def self.gas_mileage(gallons, miles)
#     puts "#{miles / gallons} miles per gallon of gas"
#   end

#   def speed_up(number)
#     self.speed += number
#     puts "You push the accelerator and speed up #{number} MPH"
#   end

#   def brake(number)
#     self.speed -= number
#     puts "You push the break and slow down #{number} MPH"
#   end

#   def current_speed
#     puts "You are currently driving #{speed} MPH"
#   end

#   def turn_off
#     self.speed = 0
#     puts "You are now parked!"
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "Sweet upgrade! Your car is now #{color}"
#   end

#   def to_s
#     "This is a cool #{color} #{model} from #{year}"
#   end
# end

# eve = MyCar.new(2021, "white", "Tesla", 240, 12)

# MyCar.calculate_mileage(eve)
# MyCar.gas_mileage(12, 240)

# # 2 Override the to_s method to create a user friendly print out of your object.

# puts eve

# 3 when running the following code:
# class Person
#   attr_reader :name
#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Steve")
# bob.name = "Bob"

# We get the following error...
# test.rb:9:in `<main>': undefined method `name=' for
#   #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

# Why do we get this error and how do we fix it?
# We get this error because we've setup @name to be read only, so we can set it to do both or just set, and run it again:
class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
