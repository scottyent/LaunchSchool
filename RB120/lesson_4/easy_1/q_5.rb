# Which of these two classes has an instance variable and how do you know?

  class Fruit
    def initialize(name)
      name = name
    end
  end

  class Pizza
    def initialize(name)
      @name = name
    end
  end

  # Pizza is the only class with an instance variable. Instance variables are
  # defined by using the @symbol, and fruit is not doing that (just creating
  # a local variable inside the method).

  # Correct, but they gave a cool way to check this:

  hot_pizza = Pizza.new("cheese")
  orange = Fruit.new("Apple")

  p hot_pizza.instance_variables
  p orange.instance_variables

  # So we can see that when creating an instance, it did not create an instance
  # variable for fruit, but did for pizza.