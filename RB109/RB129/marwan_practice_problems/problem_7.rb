#7 — What concept does this code demonstrate? What will be the output?

class Bird
  def fly
    p "#{self.class} is flying!"
  end
end

class Pigeon < Bird; end
class Duck < Bird; end

birds = [Bird.new, Pigeon.new, Duck.new].each(&:fly)

# This code is demonstrating the way that self works, as well as inheritance.

# Both pigeon and duck inherit the fly method from their Bird superclass. because
# these are instance methods, the self is referring to the object (instance) that
# is calling it, so when called by a Bird object, it will return the class Bird
# for #{self.class}.

#   In other words this will output to the screen:

# "Bird is flying"
# "Pigeon is flying"
# "Duck is flying"

# This is an example of polymorphism through inheritance. The interface (fly) is
# the same for all birds, and they are all given access to it via inheritance.
# In this way, multiple different classes can respond to the same interface (fly).

# This also allows for overriding of methods, keeping the interace in tact.
# For example, penguin can define its own fly implementation that prints
# "Penguins don't fly!" and the developer doesn't have to worry that they call
# #fly on Penguins, and get an error. It will respond to the same interface
# and react for what's approrpiate for that class.