# How would you print all the numbers in the following range?

print(list(range(3, 17, 4)))

# That'll print a list version inlcudes all the numbers. However, if we
# literally want to print each individual number, we could do:

for num in range(3, 17, 4):
    print(num)

