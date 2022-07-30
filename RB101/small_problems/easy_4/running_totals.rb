# Write a method that takes an Array of numbers, and returns an Array with the same number of elements,
# and each element has the running total from the original Array.

# Input: An array of numbers
# Output: A new array with a running total of the numbers as each element (so every element before itself, summed)

# Rules
# The first number is just itself since there's nothing to sum before it
# an empty array just returns an empty array

# Alogorithm
# Create a sum variable
# Create an empty array to use as a return
# Iterate through the original array
# increment the sum by the current number
# Add the sum to the empty array
# Deal with the emptiness? nah that should work because an empty array wont' add anything to sum so we're good

def running_total(original_array)
  # running_array = []
  sum = 0

  original_array.map { |num| sum += num }

  # original_array.inject do |sum, num|
  #   sum + num
  #   puts sum
  #   puts num
  # end

  # original_array.each_with_object([]) do |num, array|
  #   sum += num
  #   array.push(sum)
  # end
end

# Tests
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []