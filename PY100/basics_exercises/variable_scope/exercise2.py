# What will the following code do and why?
# Don't run it until you have tried to answer.

x = 10

def my_function():
    x = x + 5
    print(x)

my_function()

# I believe this will give a Name Error because the global variable is not
# accessible inside the function scope unless you specify that you're using
# the global x, so in this case x is shadowing that global variable, but also
# trying to assign itself a variable including x which within that function
# hasn't actually been defined yet.

# It wasn't a NameError, it was an UnboundLocalError because it's accessing
# a local variable that doesn't have a value yet.