# Input: an integer (positive, negative or zero)
# Output: True if the integers absolute value is odd, false otherwise
# Rules
# you can't use #odd? or #even? in the implementation
# You are solving for the absolute value of the number, not the negative
# You can assume it's a valid integer

# Algo
# Convert number to absolute value
# Check if it's divisible by 2 evenly or not
# if not, return true, if so, return false

# Implementation 1 (I could get rid of reversing the negatives, because modulo doesn't need to do that)
# def is_odd?(number)
#   number *= -1 if number < 0
#   number % 2 != 0
# end

# Implementation 2 using remainder
def is_odd?(number)
  # number *= -1 if number < 0
  number.remainder(2) != 0
end

# Test Cases
puts is_odd?(2) == false  # => false
puts is_odd?(5) == true   # => true
puts is_odd?(-17) == true # => true
puts is_odd?(-8) == false  # => false
puts is_odd?(0) == false   # => false
puts is_odd?(7) == true   # => true



