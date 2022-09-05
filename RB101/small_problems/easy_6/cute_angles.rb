# Input: Floating point number representing an angle between 0 and 360 degrees
# Output: The angle represented as a string, with degrees, minutes and seconds. Using the degree symbol for degrees, ' for minutes, and " for seconds

# Algo
# Isolate the part of the number left of the decimal, use that for degrees
# Multiply the part right of the decimal by 60
# Isolate the part of the number left of the decimal, use that for minutes
# Multiply the part right of the decimal use that for seconds
# Format all into a nice string

# Further Exploration
# Handle numbers larger than 360 or negative
# If they're larger than 360, subtract 360.
# If they're negative, subtract them from 360.
# If they're bigger than 360 and negative, subtract 360 first than subtract from 360

require 'pry'
require 'pry-byebug'

DEGREE = "\xC2\xB0"

def dms(degree)
  if degree.abs > 360
    degree = degree.positive? ? degree % 360 : (360 - (degree.abs % 360))
  elsif degree < 0
    degree = 360 + degree
  end

  converted = []

  while converted.size < 3
    left, right = degree.divmod(1)
    converted << left
    degree = (right * 60).round(2)
  end

  %(#{converted[0]}#{DEGREE}%02d'%02d") % [converted[1], converted[2]]
end



# Test Cases
p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Further Exploration
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")