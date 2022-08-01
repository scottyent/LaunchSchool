# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(),
# Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

# Input: Positive integer or 0
# Output: the string version of the integers

# Rules
# Numbers have to be positive or zero


# Algo
# Create a dictionary that assigns the possible numbers from 0-9 :DONE
# Use digits to split input into an array :DONE
# map to a new array that has the looked up string values
# join and return the string

def integer_to_string(number)
  number.digits.reverse.join
end



p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'