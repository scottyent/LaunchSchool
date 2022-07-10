# Input: Array of integers
# Output: integer representing the average of the numbers in the array
# Rules:
# Use Integer division, not float division

# Algo
# Return the result of array sum divided by array size

# Implementation 1
# def average(number_array)
#   number_array.sum / number_array.size
# end

# Official answer:
def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number } # Looks like it'd be easier to write numbers.reduce(:+) IMO
  sum / numbers.count
end

# Further Exploration - make a float as the return
# def average(number_array)
#   number_array.sum / number_array.size.to_f
# end

puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40