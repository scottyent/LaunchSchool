# Code from the chapter

# class GoodDog
#   attr_accessor :name, :height, :weight

# 	def initialize(n, h, w)
# 		@name = n
#     @height = h
#     @weight = w
# 	end

#   def speak
#     "#{name} says arf!"
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     "#{name} weighs #{weight} and is #{height} tall."
#   end
# end


# fido = GoodDog.new("Fido", 5, 60)
# puts fido.name
# puts fido.height
# puts fido.weight
# puts fido.info

# fido.change_info("Adam", 2, 30)
# puts fido.name
# puts fido.height
# puts fido.weight
# puts fido.info

# Exercises:
=begin
Create a class called MyCar. When you initialize a new instance or object of the class,
allow the user to define some instance variables that tell us the year, color, and model of the car.
Create an instance variable that is set to 0 during instantiation of the object to track the current
speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.
=end

class MyCar
  attr_accessor :year, :color, :model, :speed

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def speed_up(number)
    self.speed += number
    puts "You push the accelerator and speed up #{number} MPH"
  end

  def brake(number)
    self.speed -= number
    puts "You push the break and slow down #{number} MPH"
  end

  def current_speed
    puts "You are currently driving #{speed} MPH"
  end

  def turn_off
    self.speed = 0
    puts "You are now parked!"
  end
end

eve = MyCar.new(2021, "White", "Tesla")
eve.speed_up(15)
eve.current_speed
eve.brake(5)
eve.current_speed
eve.turn_off
eve.current_speed
