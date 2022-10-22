# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

=begin
Input: array of integers
Output: an array of the 2 integers closest to each other.


Rules
Just integers
new array

Steps:
use sort by with a block to take the absolute value of the comparison, then return the first 2 as it'd be the smallest difference

permutations

initialize lowest pair = [] :DONE
all_couples = permutation :DONE
initialize difference to the first pair difference
iterate through all couples, and if the difference is less than the current difference, reset differnce to that
and set lowest pair to the set


=end

# def closest_numbers(num_array)
#   results = {}
#   num_array.sort do |num1, num2|
#     difference = (num1 - num2).abs
#     results[[num1, num2]] = difference
#   end

#   lowest_difference = results.min_by { |comparison, difference| difference }

#   lowest_difference[0]
# end

require 'pry'
require 'pry-byebug'

def difference(array_of_two)
  (array_of_two[0] - array_of_two[1]).abs
end

def closest_numbers(num_array)
  all_couples = []
  num_array.permutation(2) { |combo| all_couples << combo }

  difference = difference(all_couples[0])
  lower_pair = all_couples[0]

  all_couples.each do |array|
    current_difference = difference(array)
    if current_difference < difference
      difference = current_difference
      lower_pair = array
    end
  end

  lower_pair
end

# Test Cases

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".