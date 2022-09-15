# Input: An array of elements
# Output: A new array with the elements reversed

# Rules
# This time it's not mutating the original, just creating a new array.
# You aren't allowed to modify the original. Oh shoot, no using pop then.


# Algo
# Create empty array to add reversed elements to
# create index the length of the array minus one
# use the times iterator to run the length of the array amount of times
# add the original array element at the index to the new array
# decrement the index counter


def reverse(array)
  array.each_with_object([]) { |element, array| array.prepend(element) }
end

# Test Cases
p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true