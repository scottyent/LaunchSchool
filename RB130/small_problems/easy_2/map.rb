# Rebuilding map to take an array, return same amount of elements in the array
# if empty array, return empty array

require 'pry'
require 'pry-byebug'

def map(collection)
  return [] if collection.empty?
  collection.each_with_object([]) { |item, array| array << yield(item) }
end




# Test Cases
# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

Test with Hashes
p map({1 => 'a', 2 => 'b', 3 => 'c', 4 => 'd'}) { |value| value.upcase } == ['A', 'B', 'C', 'D']
