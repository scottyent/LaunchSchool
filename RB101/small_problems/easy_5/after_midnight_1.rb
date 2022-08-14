require 'pry'
require 'pry-byebug'

# Input: Positive or negative integer representing minutes
# Output: a string that represents the time in 24 hour format

# Rules
# Can't use date and time classes
# Negative means going backwards in time from midnight
# Positive means going forward in time from midnight
# The number can be greater than the amount of minutes in a day, so it has to rollover to a new "Day"

# Algorithm
# convert minutes to hours and minutes :DONE
# Add or subtract those hours and minutes from 24 hours : DONE
# If hours are larger than 24 hours, subtract 24 hours until it's less than 24 hours : DONE
# format this into string format and output the result

def time_of_day(minutes)
  hours, minutes = minutes.divmod(60)

  negative = true if hours < 0
  hours = hours.abs

  while hours >= 24
    hours -= 24
  end

  negative && hours != 0 ? hours = 24 - hours : hours = 0 + hours

  "%02d:%02d" % [hours, minutes]
end

# Tests
# p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"