class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self.
# What does self refer to here?

# In this instance, self would refer to the object that it's being called by
# which would be the instance object once it's instantiated and this instance
# method is used.

# Correct!

