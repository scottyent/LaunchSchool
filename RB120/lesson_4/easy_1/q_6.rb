# What could we add to the class below to access the instance variable @volume?

# class Cube
#   def initialize(volume)
#     @volume = volume
#   end
# end

# We could add a few things, if we want access to be both readable and writable:

# attr_accessor :volume

# OR

=begin
def volume
  @volume
end

def volume=(value)
  @volume = value
end
=end

# I'll go with the shorthand accessor method:

class Cube
  attr_accessor :volume
  def initialize(volume)
    @volume = volume
  end
end

ice = Cube.new(10)
puts ice.volume
ice.volume = 5
puts ice.volume

# Correct, but I found the answer to this one not very satisfying. They said
# we could do it this way:
#   big_cube.instance_variable_get("@volume")
# But that that is bad practice, and to creat a manual getter like this:
# def get_volume
#   @volume
# end

# But in the course materials, it starts with that and then changes to make it
# something like def volume, not def get_volume - so I think both answers,
# while technically correct, are not good answers.