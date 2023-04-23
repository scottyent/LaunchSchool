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
# Addition
# Appropriately add the minutes :DONE
# Wrap if it goes over 23 :DONE
# Returns a new object :DONE

# Subtraction
# appropriately subtracts from both minutes AND hours :DONE
# handles the wrap around in reverse :DONE
# returns a new object:DONE

# Equivalence
# implement == funciton that uses to_s to compare :DONE

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
    change_time(additional_mins) do |new_minutes|
      total_minutes = time_to_minutes + new_minutes
      total_minutes.divmod(60)
    end
  end

  def -(subtracted_mins)
    change_time(subtracted_mins) do |new_minutes|
      total_minutes = time_to_minutes - new_minutes
      total_minutes = adjust_negative(total_minutes) if total_minutes < 0
      total_minutes.divmod(60)
    end
  end

  def ==(other_clock)
    to_s == other_clock.to_s
  end

  private

  def adjust_negative(mins)
    (mins < -1440) ? (mins % 1440) : (1440 + mins)
  end

  def minutes_to_time(total)
    total.divmod(60)
  end

  def time_to_minutes
    (@hours * 60) + @min
  end

  def change_time(minutes)
    new_hours, new_mins = yield(minutes)
    new_hours = validate_hours(new_hours)
    Clock.new(new_hours, new_mins)
  end

  def validate_hours(hours)
    (hours > 23) ? (hours % 24) : hours
  end
end
