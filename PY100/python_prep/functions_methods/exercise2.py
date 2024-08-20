# Take a look at this code snippet:

foo = 'bar'

def set_foo():
    foo = 'qux'

set_foo()
print(foo)

# What does this program print? Why?

# This will print out the string 'bar' because the local variable foo is simply shadowing
# the global value foo, but it is only accessible within the function itself. Once the
# function is done running, it returns to the global scope, and the variable foo has not
# been altered

foo = [1, 2, 3, 4]

def minus_one(item):
    item.pop()

minus_one(foo)
print(foo)

# Just as an example, different example, I made this which shows the negtaive impacts of mutating
# an argument. In this instance, you're actually mutating an object that exists outside of the local
# scope of the function because the object is a mutable object. You changed it within the function,
# but that also changes it in the global scope.
