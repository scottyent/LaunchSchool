# Rewrite your code from the previous exercise to use a ternary expression.

# Luckily I already wrote that so I'll just copy and paste here:

import random
random_number = random.randint(0, 1)

print(random_number)

print('Yes!') if random_number else print('No.')

# oh I like the way they wrote it instead, because the ternary will return a
# value that you can then pass to the print function!

print('Yes!' if random_number else 'No.')

