class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# In the name of the cats_count method we have used self.
# What does self refer to in this context?

# In this context, it refers to the class. So when called on Cat.cats_count,
# it will trigger the self.cats_count method.

# Correct