# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:
=begin
Input: array of integers
Output: the minium sum of 5 consecutive itengers (so an integer)

Rules
fewer than 5 elements, returns nil :DONE

[1, 2, 3, 4, 5, 6] - 6 array - 2 iterations
0, 5 . sum
1, 5 . sum

10 array - 6 iterations


Steps:
initialize results array
iterate over the array from 0 to size minus 6
take a slice from that index to 5 length and shove it into results
then do min by sum, and return the sum

=end

def minimum_sum(num_array)
  return nil if num_array.size < 5

  slices = []
  0.upto(num_array.size - 5) { |index| slices << num_array[index, 5] }

  slices.min_by { |slice| slice.sum }.sum
end

# Test Cases
p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".