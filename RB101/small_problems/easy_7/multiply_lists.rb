# Input: two arrays of numbers
# Output: A new array, multiplying the same index elements together

# Rules
# You can assume both arrays are of the same size (So index iteration works)

# Algo
# Iterate over one array (Each with index perhaps)
# Multiply the element with the same index element in the other array
# Add result to result array
# return result array


# My solution
# def multiply_list(array1, array2)
#   result = []

#   array1.each_with_index do |number, index|
#     result << number * array2[index]
#   end
#   result
# end

# Challenge to do it in a one liner with Array#zip
def multiply_list(array1, array2)
  array1.zip(array2).map { |sub_array| sub_array.inject(:*) }
end

# Test case
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]