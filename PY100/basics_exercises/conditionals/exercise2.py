# The code provided below randomly initializes random_number to either 0 or 1
# each time it is executed.

# Write an if statement that prints Yes! if random_number is 1, and
# No. if random_number is 0.

import random
random_number = random.randint(0, 1)

print(random_number)

if random_number:
    print('Yes!')
else:
    print('No.')

# Alternatively, using a ternary:

print('Yes!') if random_number else print('No.')

# Further Exploration
# Take a few minutes to check out the official Python documentation for the
# random module to see what else it can do. Don't worry if some of the functions
# appear to be very "mathy"; you don't have to memorize these functions.