# Input: two arrays
# Output: one new array, merging the 2 arrays and removing duplicates

# Rules
# You have to de-dupe the values
# That's it :)

# Algo
# just add one to the other and uniq it?

def merge(array1, array2)
  array1 << array2
  array1.flatten!.uniq!
end

# Their solution includes using the union method for array, which does exactly what we want here. Just a singular pipe (array 1 | array 2)... pretty convenient!

# Test case
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]