# Input: Positive Integer
# Output: an integer representing the sum of the individual digits (e.g. 23 -> 5, because it's 2 + 3)
# Rules
# Both input and output have to be integers

# Algo
# Take the number, convert it to a data format that we can split apart into individual characters (likely string)
# Used the split up data points to add up thd eigits
  # How to get strings back to integers without a loop (as per the challenge at the bottom)
# Return the sum as the result


def sum(number)
  number.to_s.chars.sum(&:to_i)
end

# Tests
p sum(23) == 5
p sum(496) == 19
p sum(123_456_789) == 45