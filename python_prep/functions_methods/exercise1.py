# What happens when you run the following program? Why do we get that result?
# 

def set_foo():
    foo = 'bar'

set_foo()
print(foo)

# We will get a variable not defined error when we attempt to print the variable 'foo'
# The reason for this is that the variable is initialized within the local scope of the
# function set_foo. It is never initialized in the global scope, and is not accessible
# outside of the function. 
