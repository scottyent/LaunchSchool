# Input: A year (integer)
# Output: A new string that tells you the century that year is with the correct ending

# Rules
# You only have to return the century and the ending, nothing else in the string (e.g. '20th' not '20th century')
# st, nd, rd, or th are the appropriate endings
# New centuries begin in years that end in 01 and continue to the 00 inclusive (so 1901-2000 is the 20th century)


# Algorithm
# since the last 2 years dictate where it falls, separate the last two digits, and check if equal to 00
# Use strings for this because manipulation using integers is difficult
# If it's equal to 00, then the century is simply the front part of the array
# If it's not 00, it's the front part of the array + 1
# once you know the century:
# Append the appropriate difference for numbers ending in 1, 2, or 3 unless preceded by a 1
# All others end in th

def century(year)
  year = year.to_s
  year_end = year[-2, 2]
  year_beginning = year[-year.size, year.size - 2]
  p year_beginning

  if year_end == '00'
    century = year_beginning
  else
    century = (year_beginning.to_i + 1).to_s
    p century
  end

  last_digit = century[-1].to_i
  last_two_digits_century = century[-2, 2].to_i

  if (11..13).include?(last_two_digits_century) || !(1..3).include?(last_digit)
    century << 'th'
  else
    ending = case last_digit
    when 1
      'st'
    when 2
      'nd'
    when 3
      'rd'
    end

    century << ending
  end

  century
end
# Tests

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'