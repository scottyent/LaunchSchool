# Write a method that takes a sorted array of integers as an argument, and
# returns an array that includes all of the missing integers (in order)
# between the first and last elements of the argument.

def missing(sorted)
  range = sorted.first..sorted.last
  range.each_with_object([]) do |num, result|
    result << num unless sorted.include?(num)
  end
end

# # without using a method that uses a block
# def missing(sorted)
#   counter = sorted.first
#   result = []

#   while counter < sorted.last
#     result << counter unless sorted.include?(counter)
#     counter += 1
#   end

#   result
# end

# Test
p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []