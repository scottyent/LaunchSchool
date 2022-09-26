# Input: An array
# Output: A new array, with the first element moved to the back of the array

# Rules
# You cannot use rotate or rotate! methods
# You should not modify the original array
# The array can be made up of any elements (integers, strings, etc)
# A single element array just returns itself

# Algo
# return the array right back if the size is equal to 1
# Initialize first_element and set it to array[0]
# Create result array variable using a slice from (1..)
# Shovel first_element into the result and return it

# My solution
# def rotate_array(array)
#   return array if array.size == 1
#   leading_element = array[0]
#   result = array[(1..)] << leading_element
# end

# Their simpler solution
def rotate_array(array)
  array[(1..)] + [array[0]]
end

# Test Cases
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true


# Further Exploration
# Create the same rotate function but for string and then integer, you can use the above method if you want

def rotate_string(string)
  array = string.chars
  array[(1..-1)] + [array[0]].join
end

p rotate_string("walk")
p rotate_string('a')
p rotate_string('adam')

def rotate_integer(num)
  string_version = rotate_string(num.to_s)
  string_version.to_i
end

p rotate_integer(1234)
p rotate_integer(1)
p rotate_integer(4523)