# Input: An integer
# Output: an integer representing the maximal rotation of that number

# Rules
# You can use the previous exercise's method to implement
# You don't have to handle multiple zeros


# Algo
# Determine the size of the integer by converting to string and calling size
# use size as the starting point for cut size, using the rotate_rigthmost_digits
# continue a loop of cutting, while saving the end result for each loop as the new number
# decrement the cutting size each loop as well
# Rotate until cut_size == 2 for the rightmost digit
# then return the last result

require 'pry'
require 'pry-byebug'

def rotate_string(string)
  array = string.chars
  (array[(1..-1)] + [array[0]]).join
end

def rotate_rightmost_digits(num, cut_size)
  number_string = num.to_s
  rotated_piece = rotate_string(number_string.slice!(-cut_size..-1))
  number_string << rotated_piece
  number_string.to_i
end


# def max_rotation(number)
#   cut_size = number.to_s.size

#   while cut_size >= 2
#     number = rotate_rightmost_digits(number, cut_size)
#     cut_size -= 1
#   end

#   number
# end

def max_rotation(int)
  digits = int.digits.reverse
  rotated_digits = []

  until digits.empty?
    digits << digits.shift
    rotated_digits << digits.shift
  end

  rotated_digits.join.to_i
end

# Test Cases
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(1005) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845