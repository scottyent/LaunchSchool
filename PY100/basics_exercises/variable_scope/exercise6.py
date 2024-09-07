a = 1

def my_function():
    a = 2

my_function()
print(a)

# this will print 1. If you're attempting to assign a variable within a function
# it will intialize that variable as a local variable inside the function. If
# what you want to do is reassign (which appears to be the case here)