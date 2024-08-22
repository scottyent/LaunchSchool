# Write Python code to create a new tuple from (1, 2, 3, 4, 5). The new tuple
# should be in reverse order from the original. It should also exclude the first
# and last members of the original. The result should be the tuple (4, 3, 2).

original = (1, 2, 3, 4, 5)

print(original[1:-1][::-1])

# Perhaps more readable might be:

shortened = original[1:-1]
backwards = shortened[::-1]
print(backwards)

# This solution given is a bit more elegant, I forgot about giving the
# indexes to slice in reverse and using a negative step value:

my_tuple = (1, 2, 3, 4, 5)
result = my_tuple[3:0:-1]
print(result)       # (4, 3, 2)