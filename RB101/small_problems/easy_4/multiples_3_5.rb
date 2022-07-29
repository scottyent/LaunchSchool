# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number,
# and then computes the sum of those multiples. For instance, if the supplied number is 20,
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# Input: An integer to use as the upper bound of the range
# Output: an integer representing the sum of all numbers in the range divisible by 3 or 5

# Rules
# You can assume the input is greater than 1
# You don't count numbers twice if they're divisible by both (e.g. in the example above, 15 is divisible by both, but isn't counted twice)
# Return only a simple integer
# The range starts from 1 and goes to the given number (inclusive)

# Algo
# Iterate through the range
# check if each number is divisible by 3 OR 5
# if it is, add it to a new array
# output the sum of the array

def multisum(number)
  (1..number).select { |num| num % 3 == 0 || num % 5 == 0 }.sum
end

# Tests
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168