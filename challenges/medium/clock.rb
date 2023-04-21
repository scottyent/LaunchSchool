# Create a clock that is independent of date.

# You should be able to add minutes to and subtract minutes from the time
# represented by a given Clock object. Note that you should not mutate
# Clock objects when adding and subtracting minutes -- create a new Clock object.

# Two clock objects that represent the same time should be equal to each other.

# You may not use any built-in date or time functionality; just use arithmetic
# operations.

# Rules
# Explicit:
# * clock objects need a comparison operator that compares time
# * clock objects create a new clock object when subtracting or adding minutes
# * you should only be able to add or subtract minutes, and it should
# work with literal arithmetic (aka Clock.at(8) + 20 -> 08:20)
# Implicit:
# * there needs to be a to_s function that formats the output of clocks
# * Clock setting happens via a class method, but it instantiates new clocks
# * 24 hour time, and has to wrap around to 00 if it goes over 60.
# * we are assuming all of this is valid

# Functions needed
# Class - Clock.at(accepts hour, accepts minutes)
# Instance - + and - which instantiates new object with the time +'d or -'d
# Comparison operator to compare times
# to_s to format the time itself

# Algorithm:
# * create the class method that will then instantiate a new object with the
# hours and minutes given (default minutes to 00) :DONE
# * write instance initialization to accept hours, and seconds :DONE
# write a to_s function to format :DONE

# then we tackle adding and subtracting.

class Clock
  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def initialize(hours, min)
    @hours = hours
    @min = min
  end

  def to_s
    "%02d:%02d" % [@hours, @min]
  end

  def +(additional_mins)
    total_minutes = time_to_minutes + additional_mins
    new_hours, new_mins = minutes_to_time(total_minutes)
    Clock.new(new_hours, new_mins)
  end

  def minutes_to_time(total)
    total.divmod(60)
  end

  def time_to_minutes
    (@hours * 60) + @min
  end
end

clock = Clock.at(7, 30)

puts clock
puts clock.time_to_minutes
test = clock + 60

puts test
