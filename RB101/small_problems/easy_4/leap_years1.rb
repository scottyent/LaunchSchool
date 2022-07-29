# Input: an integer larger than 0 that represents a yaer
# Output: True or false depending on whether it's a leap year

# Rules:
# output only true or false
# A year is a leap year if it is evenly divided by 4, unless it's divisible by 100, unless it's divisible by 500
# Years will be anything greater than 0
# You receive an integer

# Algorithm
# leap_year variable equal to false, so that you can flip it if it becomes true
# test for whether it's cleanly divisible by 4, if not return the false leap_year variable
# If it is divisible by 4, test if it's divisible by 100
# If yes, test if it's divisible by 400 - if not, return false, if yes return true

# Flow chart here: https://app.diagrams.net/#G1szRgWSoqy78AsUUCJsD3pY9ZNIYexzyc

def leap_year?(year)

  if year % 4 == 0
    if year % 100 == 0
      year % 400 == 0
    else
      true
    end
  else
    false
  end
end

# Tests
p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true