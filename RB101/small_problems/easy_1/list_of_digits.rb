# Input: one positive integer
# Output: an array of the individual numbers in the input

# Algorithm
# Take the input number, and split it to individual numbers
# Save the numbers to an array to return the result

# Implementation 1
def digit_list(number)
  number.digits.reverse
end

# Brute force example
# def digit_list(number)
#   digits = []
#   loop do
#     number, remainder = number.divmod(10)
#     puts remainder
#     digits.unshift(remainder)
#     break if number == 0
#   end
#   digits
# end



puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true