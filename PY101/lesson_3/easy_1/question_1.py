# Will the code below raise an error?

numbers = [1, 2, 3]
numbers[6] = 5

# Yes, it will raise an index error, because you're attempting to use the
# index to reassign a value within list assigned to numbers, but the index range
# only goes up to 2 for the length of the list, and we're trying to reassign
# a value at 6.