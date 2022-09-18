# Input: two separate arrays of alements
# Output: one new array containing all elements from the two arrays, but alternating positions

# Rules
# You can assume that both arrays have at least one element
# You can also assume they have the same amount of elements - I missed this part

# Algo
# Initialize empty combined array
# start with adding from the first
# calculate the length of the combined arrays
# create a loop running the total length amount of times
# shift from the first array, then the second array, then the first array
# Using perhaps a ! operator in front of a variable that feeds to ternary

def interleave(array1, array2)
  loop_length = array1.size + array2.size
  combined_array = []
  first_array = true

  loop_length.times do |_|
    item = first_array ? array1.shift : array2.shift
    combined_array << item
    first_array = !first_array
  end

  combined_array
end

# Challenge to create this with zip and another array method:

def interleave(array1, array2)
  result = array1.zip(array2).flatten
end

# Test case
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']