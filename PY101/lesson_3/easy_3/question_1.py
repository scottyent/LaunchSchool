# Write two different ways to remove all of the elements from the following list:

numbers = [1, 2, 3, 4]

# numbers.clear() # way one

# for _ in range(0, len(numbers)): # way two
#     numbers.pop()

# LS solution is a bit more elegant:

while numbers:
    numbers.pop()

print(numbers)