# What could you add to this class to simplify it and remove two methods from
# the class definition while still maintaining the same functionality?

# I believe the answer is a getter/setter method attr_accessor

class BeesWax
  attr_accessor :type
  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

BeesWax.new("Jelly").describe_type