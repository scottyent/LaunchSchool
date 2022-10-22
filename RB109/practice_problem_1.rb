# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:
=begin
Input: an array of integers
Output: a new array with the counts representing how many numbers are smaller than the number at that index

Rules
Only get integers, not floats
If only one integers, return 0
Only unique numbers, duplicates don't count
returned array has to be the same size (so dupes count, just not in the comparison)


Steps:
initialize a results array
iterate over the array
  using count
  use a block to only return count if it's less than the number in the first iteration
  shovel that count into the results array

return results

=end

def smaller_numbers_than_current(arr)
  arr.map { |orig_num| arr.uniq.count { |num| num < orig_num } }
end

# Test Cases
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".