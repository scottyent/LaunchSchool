my_list = [1, 2, 3, [4, 5, 6]]
another_list = list(my_list)

# Given the above code, answer the following questions and explain your answers:

# Are the lists assigned to my_list and another_list equal? They're equal
# when considering equality of values, but not when considering literally the
# same object. If we were to use 'is' to compare objects, they're not the same.
# Are the lists assigned to my_list and another_list the same object?
# No. New object created.
# Are the nested lists at index 3 of my_list and another_list equal?
# Yes
# Are the nested lists at index 3 of my_list and another_list the same object?
# Yes, because list() generates a shallow copy, not a deep copy. Deep copy
# would recursively copy all items in the list so they are all new objects.

# Don't write any code for this exercise.