# What is the default return value of to_s when invoked on an object?
# Where could you go to find out if you want to be sure?

=begin
The return value of to_s on an object is usually the object information. This
is a coded object identifier (more info in the correction below).
If you use p instead of puts, it will call inspect which will also show you
instance variables and their values, instead of applying to_s.

# Correction - it prints the objects class, and then the encoding of
the object ID

We can override this behavior by customizing the to_s method inside the class
and it will print a formatted version.
=end

class Car
  def initialize(make)
    @make = make
  end

  def to_s
    "I'm a #{@make}"
  end
end

evey = Car.new("Tesla")
puts evey
