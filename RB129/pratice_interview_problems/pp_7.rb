class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels
p Vehicle.wheels

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels
p Car.wheels

# What does the code above output, and why? What does this demonstrate about
# class variables, and why we should avoid using class variables when
# working with inheritance?

# This outputs 4 then 2 for the rest of the outputs. The reason for this, which
# is also a reason we should avoid using class variables in inheritance, is
# because all subclasses share the same copy of the class variable. In other
# words, one change anywhere in there, will change the value everywhere. This
# can be quite dangerous and make code hard to fix/track down an error.