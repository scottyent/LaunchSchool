# Build a new zip method, assuming two arrays given of the same length.
# You can't use the zip method clearly.

# Algorithm
# Iterate using a times method, use that as index and add both respective
# elements to a single array inside the loop, and add that to the results array
# return the results array

def zip(array1, array2)
  result = []

  array1.size.times do |index|
    result << [array1[index], array2[index]]
  end

  result
end


# Test Cases

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]