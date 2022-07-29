# Same as previous problem, except validate for Julian Claendar (anything before 1752, you just return true if it's divisible by 4)
# I'm going to take this opportunity to refactor this leap_year one
# Flow chart here: https://app.diagrams.net/#G1szRgWSoqy78AsUUCJsD3pY9ZNIYexzyc

def leap_year?(year)
  julian = year < 1752 ? true : false
  if year % 4 == 0
    return true if julian
    return true if year % 100 != 0
    return true if year % 400 == 0
  end

  false
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true