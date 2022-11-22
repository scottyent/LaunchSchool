# How could you change the method name below so that the method
# name is more clear and less repetitive?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end
end

# The answer is to delete "light" from light_status. It highlighted this
# somewhere in the course that a lot of beginners try to include the class name
# in the methods, but it's really just redundant and you could be calling things
# like lightbulb.light_status instead of lightbulb.status

