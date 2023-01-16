#15 — What will be output when the last 2 lines of code get executed?

class Foo
  @@var = 1

  def self.var
    @@var
  end
end

class Bar
  @@var = 2
  def self.var
    @@var
  end
end

puts Foo.var
puts Bar.var

# I"m really not sure about this as I'm not entirely sure where it's
# recorded that it's technically re-assigned. If by simply defining a class
# like that, and writing it in there, counts as reassignment then they
# should both reflect 2 because class variables are shared.

# And they were both 2, for the reasons I mentioned just above.
# It would seem that just by writing out the re-assignment in the
# subclass, it has the effect of overwriting the original value.
# Now, what if they weren't related/connected by hierarchy? Then
# I think it would work as I originally thought, because they're not
# shared class variables, but completely separate? Correct! So it
# was really the fact that they were a sub/super relationship that overode
# the class variable.
