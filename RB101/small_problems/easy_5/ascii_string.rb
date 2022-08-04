require 'pry'
require 'pry-byebug'

# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument.
# The ASCII string value is the sum of the ASCII values of every character in the string.
# (You may use String#ord to determine the ASCII value of a character.)

# Input: A string
# Output: an integer representing the sum of the ASCII values of each character

# Algo
# Seperate into an array
# Iterate over it all, using perhaps inject to sum it all up
# will the empty space mess me up?

def ascii_value(string)
  ascii_sum = 0
  string.each_char { |char| ascii_sum += char.ord }
  ascii_sum
end



# Tests
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0