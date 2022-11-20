# Given the following code
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of executing the following code:

oracle = Oracle.new
puts oracle.predict_the_future

# The first line with instantiate a new object of the Oracle class
# line 2 will return a string with You will, and a random choice from the
# choices array. I THINK that works, but I'm just not sure about the calling
# of choices as a method instead of just referencing choices as an array.

# Correct - it did work as described!