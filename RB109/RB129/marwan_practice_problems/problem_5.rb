# What will the last 2 lines of code output?

class Foo
  def self.method_a
    "Justice" + all
  end

  def self.method_b(other)
    "Justice" + other.exclamate
  end

  private

  def self.all
    " for all"
  end

  def self.exclamate
    all + "!!!"
  end
end

foo = Foo.new
puts Foo.method_a # -> Justice for all
puts Foo.method_b(Foo) #-> apparently, Justice for all!!!

# I didn't realize you could pass a class around like this.
# I suppose that makes sense though, classes are just objects. Basically,
# in the call on line 24, the Foo class calls the class method mehthod_a.
# This returns the string justice, but concatenated with the result of the class
# method call `all` which being called inside a class method already, the class
# is the calling object and that functions just fine to return ` for all` and
# concatenate it to Justice for all. The returned full string from the method_a
# class then gets passed to the puts method, and is output to the screen while
#   returning nil.

# For line 25, the class object itself is passed in, and used to call
# the class metehod exclamate. You can't call exlamate directly because we use
# private for method access control, but because it is being called from within
# the class, it will return its value to the method_b which will then return
# the concatenated string to the puts method.

