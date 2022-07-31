# Write a method that takes a String of digits, and returns the appropriate number as an integer.
# You may not use any of the methods mentioned above (to_i, Integer())

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# Input: A string of numbers
# Output: the string converted to the correct integer numbers

# Rules
# We don't have to worry about + or - signs
# All the characters will be numbers and not other characters

# Steps
# Analyze each character individually
  # Perhaps using .bytes to get ASCII codes
  # OK I figured out that in ASCII, theres 48 spots between the string representation and the integer
  # so the math is, go through and get ascii numbers, then subtract 48 to get the ASCII coordinates of the number
# Perform some calculation to figure out the number
# Somehow combine them?! but not string combine them, number combine them in order to return the full number. yikes
# I'm just going to start coding this as I still don't know how to actually make them one big number
# Ok - using places to multiple the numbers by 10, 100, 1000's etc and then add it to the places as you go
# How to do this dynamically....

def string_to_integer(string_number)
  number_array = string_number.bytes.map { |ascii_value| ascii_value - 48 }.reverse
  numerical_value = number_array.shift

  number_array.each_with_index { |number, index| numerical_value += number * (10**(index + 1)) }
  numerical_value
end



# Examples/Tests
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570