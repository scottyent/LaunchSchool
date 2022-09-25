# Input: Same as before, but with a second parameter n, indicating how much to slice off from the back, then rotate
# Output: a singular number with the n amount of digits frmo the back, rotated

# Rules
# if N == 1, return the same number
# You can assume N is a positive number
# It is recommended to use the methods from the previous exercise.


# Algo
# Convert number to string
# put the slice from [-n..] of the new string (use slice! so that when you join it back later it fits)
# pass that to rotate string
# use the return and join it back at the appropriate place
# then call to_i


def rotate_array(array)
  array[(1..)] + [array[0]]
end

def rotate_string(string)
  array = string.chars
  rotate_array(array).join
end

def rotate_integer(num)
  string_version = rotate_string(num.to_s)
  string_version.to_i
end

def rotate_rightmost_digits(num, cut_size)
  number_string = num.to_s
  rotated_piece = rotate_string(number_string.slice!(-cut_size..-1))
  number_string << rotated_piece
  number_string.to_i
end

# Test Cases
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917