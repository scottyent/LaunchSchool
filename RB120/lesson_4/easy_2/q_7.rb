# Explain what the @@cats_count variable does and how it works.
# What code would you need to write to test your theory?

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

# The cats_count variable is a class variable to keep track of how many
# cat objects were instantiated. Every time you instantiate an object of the
# Cat class, it will call the initialize function that will increment the
# cats_count variable. To check if this is how it works, we can check the
# value of the variable, then instantiate two cats, and check again:

puts Cat.cats_count

tabby = Cat.new("Tabby")
calico = Cat.new("Cali")

puts Cat.cats_count

# This works! The alternative option they gave was that you can add a puts
# at the end of the initialization method so it will output the value of the
# cats_count each time one is instantiated.