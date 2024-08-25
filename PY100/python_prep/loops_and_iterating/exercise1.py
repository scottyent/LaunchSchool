# The following code causes an infinite loop (a loop that never stops iterating).
# Why?

counter = 0

while counter < 5:
    print(counter)

# This will be an infinite loop because the body of the while loop doesn't
# modify the counter being used in the condition. If it is not modified on
# each iteration, then the counter will forever be less than 5, and the loop
# will continue forever.