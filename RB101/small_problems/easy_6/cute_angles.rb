# Input: Floating point number representing an angle between 0 and 360 degrees
# Output: The angle represented as a string, with degrees, minutes and seconds. Using the degree symbol for degrees, ' for minutes, and " for seconds

# Algo
# Isolate the part of the number left of the decimal, use that for degrees
# Multiply the part right of the decimal by 60
# Isolate the part of the number left of the decimal, use that for minutes
# Multiply the part right of the decimal use that for seconds
# Format all into a nice string
require 'pry'
require 'pry-byebug'

DEGREE = "\xC2\xB0"

def dms(degree)
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