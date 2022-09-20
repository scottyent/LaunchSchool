# Input: Array of integers
# Output: A float rounded to three decimals, multiplies all numbers, divide by size (averaged)

# Algo
# Use inject to multiply all numbers in the array
# Divide by array size (to_f one of the numbers)
# round to 3 digits

def show_multiplicative_average(number_array)
  numerator = number_array.inject(:*)
  denomenator = number_array.size
  average = (numerator / denomenator.to_f).round(3)
  puts "The result is #{average}"
end

# Test Cases
show_multiplicative_average([3, 5])         # => The result is 7.500
show_multiplicative_average([6])          # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667