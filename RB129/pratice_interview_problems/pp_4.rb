class AnimalClass
  attr_accessor :name, :animals

  def initialize(name)
    @name = name
    @animals = []
  end

  def <<(animal)
    animals << animal
  end

  def +(other_class)
    name + ", " + other_class.name
  end
end

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes

# What is output? Is this what we would expect when using `AnimalClass#+`?
# If not, how could we adjust the implementation of `AnimalClass#+` to be more
# in line with what we'd expect the method to return?

# It will return an array of the two groups of animal object arrays, concatenated together
# The `AnimalClass#+` method is relying here on Array concatenation, and so will
# simply create a new array combining the elements into one array. Since they
# are all Animal objects, it will be an array of 6 animal objects.

# To be honest, I"m not sure what we were exepcting to happen here. That seems
# pretty right to me, so I don't really know what I'd be adjusting towards.

# Oh, maybe it's just looking to return the names of the classes themsleves since
# it's called some animal classes, so we can change the + function to instead
# return the names of the objects that were created, perhaps in an array.

# But plus should return the same thing that it is adding, in this case strings
#   so I'll return a string.