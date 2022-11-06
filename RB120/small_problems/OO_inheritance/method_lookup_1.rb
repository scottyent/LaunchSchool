# Using the following code, determine the lookup path used when invoking
#  cat1.color. Only list the classes that were checked by Ruby when
#  searching for the #color method.

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color

# The answer is that it checks the Cat class, then goes to the Animal superclass
# finds the color getter method, executes and stops.

# So Cat -> Animal