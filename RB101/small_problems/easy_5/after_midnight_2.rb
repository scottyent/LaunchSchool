# Input: "00:00" formatted string, representing 24 hour time
# Output: the minutes before or after midnight (two separate methods)

# Rules
# Two separate methods, one for before midnight and one for after
# Can't use Date and Time methods
# can take in 24:00 to represent midnight as well

# Algo
# Split the input into an array with integers in them, representing hours and minutes
# Multiply the hours to get minutes, and merge it into the minutes function
# Use the minutes function to calculate how far from midnight in respective direction

require 'pry'
require 'pry-byebug'

MINUTES_PER_HOUR = 60


def after_midnight(time_string)
  hours, minutes = time_string.split(":").map { |num_string| num_string.to_i }
  hours = 0 if hours == 24
  minutes += hours * MINUTES_PER_HOUR
end

def before_midnight(time_string)
  hours, minutes = time_string.split(":").map { |num_string| num_string.to_i }
  hours = 0 if hours == 24
  minutes == 0 ? 0 : (1440 - after_midnight(time_string))
end

# Tests
p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0