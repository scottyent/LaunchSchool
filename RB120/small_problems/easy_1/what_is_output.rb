# What output does this code print? Fix this class so that there are no surprises
# waiting in store for the unsuspecting developer.

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

#output:
# "Fluffy"
# "My name is FLUFFY"
# FLUFFY
# FLUFFY

# Correct!

# To fix this:
# I just changed the to_s so that when it interpolates the name variable, it calls a non destructive upcase call
# I don't really know what the desired behavior is but I assume the goal is to not mutate the original string
# but upcase it when printing out the object information