# We have an Oracle class and a RoadTrip class that
# inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:
trip = RoadTrip.new
puts trip.predict_the_future

# Ok, I think this will behave the same, but use the choices from RoadTrip
# because we're overriding the behavior of the superclass with the choices
# method from the subclass.

# Correct!



