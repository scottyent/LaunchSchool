# Input: An array (elements not specified)
# Output: an array contained two nested arrays that are halves of the original

# Rules
# If it's an odd number, the middle number should be in the first half array

# Algo
# Determine array length
# create slices of the array from that point
# nest them into a new array and return it

require 'pry'
require 'pry-byebug'

# First implementation
def halvsies(array)
  index = 0
  midpoint = (array.size / 2.0).ceil(0)

  left, right = array.partition do |item|
    index += 1
    index <= midpoint
  end

  [left, right]
end

# Second implementation
# def halvsies(array)
#   midpoint_index = (array.size / 2.0).ceil(0)
#   [array[0, midpoint_index], array[midpoint_index, array.size - midpoint_index]]
# end

# Test Cases:
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]