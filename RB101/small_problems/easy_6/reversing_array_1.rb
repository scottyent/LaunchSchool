# Input: An array of items
# Output: The same array object, but with the items reversed

# Rules:
# It has to be the same array object - so it mutates the array
# You can't use reverse or reverse!

# Algo
# Assignment of the ojbects doesn't change the array object
# So I just need to reassign the individual items in a reverse fashion
# Iterate through the list
# Assign the current value to a temporary holder
# Reassign current space to the end of the array (using a counting down index counter)
# then assign that same last space to the temp holder

require 'pry'
require 'pry-byebug'

def reverse!(array)
  index = 0
  backwards_counter = -1

  while index < (array.size / 2)
    temp_holder = array[index]

    array[index] = array[backwards_counter]
    array[backwards_counter] = temp_holder
    backwards_counter -= 1
    index += 1
  end

  array
end

# Test Cases
list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true