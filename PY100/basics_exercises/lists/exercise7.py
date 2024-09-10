# Predict the output of the code shown below. When you run the code, do you see
# what you expected? Why or why not?

list1 = [2, 6, 4]
list2 = [2, 6, 4]

print(list1 == list2)

# True is what I expect. Equality for lists test if the values are the same
# and in the same order. If we were to test using 'is' if they're literally
# the same object, then this would return false:

print(list1 is list2)