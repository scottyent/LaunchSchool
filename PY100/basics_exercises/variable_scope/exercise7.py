a = 1

def my_function():
    global a
    a = 2

my_function()
print(a)

# This will print 2! Since we called the global keyword on line 4, the function
# understands that what you're using inside it is not a local variable `a` but
# rather the global variable a, so reassignment will work for that global variable