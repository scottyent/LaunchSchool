# Input: Positive integer
#: Output: an integer with the numbers reverse

# Rules
# It should chop off leading zeros - to_i does that anyway

# Algo
# Convert to string
# reverse string
# convert to I

def reversed_number(number)
  number.to_s.reverse.to_i
end

# Test Cases
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1