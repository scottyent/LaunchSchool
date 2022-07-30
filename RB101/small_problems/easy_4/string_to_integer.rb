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



# Examples/Tests
string_to_integer('4321') == 4321
string_to_integer('570') == 570