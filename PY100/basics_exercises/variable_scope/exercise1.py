# What will the following code do and why?
# Don't run it until you have tried to answer.

if True:
    my_value = 20

print(my_value)

# This will print 20, because if blocks don't have their own local scope.

# What do you think will happen if we run the following code instead:

if False:
    my_new_value = 42

print(my_new_value)

# It will be an error that the variable is undefined (apparently called
# NameError). Since that block never executes due to the False condition,
# the assignment to that variable never happens.