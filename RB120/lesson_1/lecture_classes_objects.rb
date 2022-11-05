# 1. Given the below usage of the Person class, code the class definition.

# class Person
#   attr_accessor :name

#   def initialize(name)
#     self.name = name
#   end
# end


# bob = Person.new('bob')
# p bob.name                  # => 'bob'
# bob.name = 'Robert'
# p bob.name                  # => 'Robert'

# 2. Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(first_name)
#     self.first_name = first_name
#     self.last_name = ''
#   end

#   def name
#     if last_name.empty?
#       self.first_name
#     else
#       self.first_name + " " + self.last_name
#     end
#   end
# end

# Much more clever solution they came up with:

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     pieces = full_name.split
#     @first_name = pieces.first
#     @last_name = pieces.size > 1 ? pieces.last : ''
#   end

#   def name
#     "#{first_name} #{last_name}".strip
#   end
# end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# Now create a smart name= method that can take just a first name or a full name,
# and knows how to set the first_name and last_name appropriately.

class Person
  attr_accessor :first_name, :last_name, :name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(first_or_full_name)
    parse_full_name(first_or_full_name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    pieces = full_name.split
    @first_name = pieces.first
    @last_name = pieces.size > 1 ? pieces.last : ''
  end
end

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'
bob.name

# 4 Using the class definition from step #3, let's create a few more people -- that is, Person objects.
# If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?
bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

bob.name == rob.name

# 5 Continuing with our Person class definition, what does the below print out?


bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# I predict this will print out the Object information because that's what happens when you call to_s, which we can
# create a custom method to change if we want (that's the next thing it asks)

# Ok I added the to_s, and it should now print the normal name in place of the bob interpolation