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

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

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

# Further exploration
name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# I think it'll do...
# "42"
# "My name is 42"
# "42"
# 43

# Correct but maybe they meant what if you ran the original mistaken code with an integer like this?
# I think they're saying the code "works" when done with an integer
# the reason is because upcasing an integer won't change anything (just returns a nil in the case of the original code)
# Also, to_s makes @name point to a brand new string object, so the original name local variable isn't affects.