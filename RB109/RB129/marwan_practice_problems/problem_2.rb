# Define a class of your choice with the following:

# Constructor method that initializes 2 instance variables.
# Instance method that outputs an interpolated string of those variables.
# Getter methods for both (you can use the shorthand notation if you want).
# Prevent instances from accessing these methods outside of the class.
# Finally, explain what concept(s) you’ve just demonstrated with your code.

class Pickles
  def initialize(salt, sliced)
    @salt = salt
    @sliced = sliced
  end

  def to_s
    "#{salt} #{sliced}"
  end

  private

  attr_reader :salt, :sliced
end

# I just demonatstrated the concept of encapsulation by limiting access to the
# getter method in the private section of the class definition. The only way
# to view these variables for an instance is to use the to_s method which
# presents the data the way I have designed, instead of a public interface for
# simply accessing the raw data. This is method access control in action.

# In terms of the overall process, I created a class called Pickles in which
# instances can be instantiated. When an instance is instantiated from the Pickles
# class, it uses it as a blueprint and has access to the specific instance methods
#   and instance variables that are specific to the new instantiated object.

# This allows us to create objects from a class that all have different attributes
# (states), but have the same behavior and overall structure.