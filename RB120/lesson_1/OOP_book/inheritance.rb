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

 # 5
 Move all of the methods from the MyCar class that also pertain to the MyTruck
 class into the Vehicle class. Make sure that all of your previous method
calls are working when you are finished.
- I already did this in the first exercise and tested speed up and spray paint
with the added functionality

# 6
Write a method called age that calls a private method to calculate the age of the vehicle.
Make sure the private method is not available from outside of the class. You'll need to
use Ruby's built-in Time class to help.
:DONE

# 7



=end

# module Towable
#   def tow
#     @towing = true
#   end
# end

# class Vehicle
#   attr_accessor :year, :color, :model, :speed

#   @@vehicle_count = 0

#   def initialize(y, c, m)
#     self.year = y
#     self.color = c
#     self.model = m
#     self.speed = 0
#     @@vehicle_count += 1
#   end

#   def self.how_many_vehicles
#     "#{@@vehicle_count} vehicles have been created"
#   end

#   def age
#     "Your #{model} is #{vehicle_age} years old."
#   end

#   def speed_up(number)
#     self.speed += number
#     "You push the accelerator and speed up #{number} MPH"
#   end

#   def brake(number)
#     self.speed -= number
#     "You push the break and slow down #{number} MPH"
#   end

#   def current_speed
#     "You are currently driving #{speed} MPH"
#   end

#   def turn_off
#     self.speed = 0
#     "You are now parked!"
#   end

#   def gas_mileage(gallons, miles)
#     "#{miles / gallons} miles per gallon of gas"
#   end

#   def spray_paint(color)
#     self.color = color
#     "Sweet upgrade! You now have a very #{color}"
#   end

#   private

#   def vehicle_age
#     Time.now.year - self.year
#   end
# end

# class MyCar < Vehicle
#   BODY_TYPE = "sedan"

#   def spray_paint(color)
#     super + " car"
#   end

#   def to_s
#     "This is a cool #{color} #{model} from #{year}"
#   end
# end

# class MyTruck < Vehicle
#   BODY_TYPE = "truck"
#   attr_accessor :towing
#   include Towable

#   def spray_paint(color)
#     super + " truck"
#   end
# end

# puts Vehicle.how_many_vehicles

# eve = MyCar.new(2021, "white", "Tesla")
# tonka = MyTruck.new(1989, "orange", "Ford")

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
# puts eve.age
# puts tonka.age

=begin
# 7 - different classes
Create a class 'Student' with attributes name and grade. Do NOT make the
grade getter public, so joe.grade will raise an error. Create a
better_grade_than? method, that you can call like so...

# puts "Well done!" if joe.better_grade_than?(bob)

- I was quite hung up on this one, but it was because I was using private
instead of protected. Protected allows access between instance methods of the same
class. So the students can use the same protected method. Private doesn't allow this.
=end

# class Student
#   attr_accessor :name
#   attr_writer :grade

#   def initialize(n, g)
#     self.name = n
#     self.grade = g
#   end

#   def better_grade_than?(other_student)
#     puts "Well done!" if get_grade > other_student.get_grade
#   end

#   protected

#   def get_grade
#     @grade
#   end
# end

# bobby = Student.new("Bobby", 90)
# adam = Student.new("Adam", 80)

# bobby.better_grade_than?(adam)

# 8
=begin
Given the following code...
  bob = Person.new
  bob.hi

And the corresponding error message...

  NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
  from (irb):8
  from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

What is the problem and how would you go about fixing it?
- The easiest solution is that we can move the hi method from private to public space,
which will then make it work.

Alternatively, if we have hi in the private space for a reason (maybe protected data), we
can create another method that calls hi inside the class itself, and then returns the result we want