#8 — What does the self keyword refer to in the good method?

class Dog
  attr_accessor :name

  def good
    self.name + " is a good dog"
  end
end

bandit = Dog.new
bandit.name = "Bandit"
p bandit.good

# self in this example is referring to the instance object that called it. because
# this is an instance method, a new object has to be instantiated from the class,
# and then that object is what calls the method directly.

# Specifically, line 11 instantiates a new object from the Dog class. On Line 12
# the bandit Dog object calls the setter method for the instance variable #name and
# sets it to "Bandit"
# on line 13, the bandit (dog object) calls the instance method good, which can
# be translated to this:

# bandit.name + " is a good dog"

# Since bandit.name is effectively the same as publicly accessing the getter method
# for the instance variable @name, it will resolve to "Bandit is a good dog."

