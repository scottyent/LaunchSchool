# Using the code below as a starting point, write a while loop that prints the
# elements of lst at each index and terminates after printing the last
# element of the list.

lst = [1, 3, 7, 15]
index = 0

while index < len(lst):
    print(lst[index])
    index += 1

# Further Exploration
# What would the code output if lst is empty? Why is that?

# It would print out nothing, because the condition to start the while loop
# would be false - it would evaluate to while 0 < 0 (length of an empty list).