def my_function():
    a = 1

    if True:
        print(a)

my_function()

# This will print 1. Within the function, a local variable a is intilized with
# the integer value of 1. There is also an if statement in the local function scope
# which will execute due to the test expression being True. Once inside that block
# it has access to the variable scope of the function, and will print out the
# value of a, which is 1.