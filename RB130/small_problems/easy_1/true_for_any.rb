# Write a method called any? that behaves similarly for Arrays.
# It should take an Array as an argument, and a block. It should return true
# if the block returns true for any of the element values. Otherwise, it
# should return false.

# Your method should stop processing elements of the Array as soon as the
# block returns true.

# If the Array is empty, any? should return false, regardless of how the
# block is defined.

# Your method may not use any standard ruby method that is named all?, any?,
# none?, or one?.



=begin
Input: Array with a block
Output: boolean - true or false. True if any item returns true, false otherwise

Rules
Explicit:
* Stop processing once you hit a true, and return true
* Don't use any standard ruby method that is a variation of this
* Takes a block as an argument
* Should return false if array is empty
Implicit:
* The code is dependent on a block, so it's OK to just use yield and not
  a conditional to check for a block


Algorithm:
* set to return false if empty
* iterate through the array, yield each item to the block
* return true if yield is positive
* otherwise leave a false at the bottom of the method to return false
=end

require 'pry'
require 'pry-byebug'

def any?(arr)
  arr.each { |item| return true if yield(item) }
  false
end

# Test Cases

# Hash Test
p any?({1=>3, 4=>6}) { |key, value| key.even? }

p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false