def my_func():
    x = 15

    def inner_func1():
        x = 25
        print("Inner 1:", x)

    def inner_func2():
        print("Inner 2:", x)

    inner_func1()
    inner_func2()

my_func()

# This will print:
# "Inner 1: 25"
# "Inner 2: 15"

# This is due to how local scope works in Python, and this also demonstrates something
# called variable shadowing. On line 2, the variable x is initialized with a value of 15.
# On line 5, while it looks like x is being reassigned, the inner_func1() function
# is actually creating a new variable x within its local scope, and assigning the number 25.
# When print is called in inner_func1(), it's referencing it's own local variabl x with a value of 25, not
# the x in it's enclosing scope (which would be 15).

# However, when inner_func2() gets called, because it's a nested function within
# my_func() and it does not have a local variable named x, it is able to access
# the x variable from the enclosing scope, and use that to print out 15.