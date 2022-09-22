# Input: Positive integer
# Output: an integer that either creates the number 2 timees, or if it's a double number, returns that number

# Algo
# Convert to a string
# Check the size, if it's odd - it's not a double number
# check if left side and ride side are equal, if not it's not a double number
# return the number back to_i

# I think write an && statement using helpers to say, is the size even, and are the halves equal
# because it'll short circuit on odd, and then it'll only be two options instead of nested

require 'pry'
require 'pry-byebug'

def equal_halves?(string)
  middle = string.size / 2
  left_side = string[0, middle]
  right_side = string[middle, middle]
  left_side == right_side
end


def twice(num)
  num_string = num.to_s

  if num_string.size.even? && equal_halves?(num_string)
    num
  else
    num * 2
  end
end

# test cases
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10