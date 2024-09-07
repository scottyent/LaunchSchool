a = 1

def my_function():
    print(a)
    a = 2

my_function()

# I misunderstood this, but got some great explanations from Gemini. Python
# scans the entirety of the function before executing it, so even though this
# local variable assignment to `a` happens AFTER the print statement on line 4,
# Python already saw that there was an assignment to `a` within the function,
# so will only try to access that and won't try to go further to outer scopes
# and find the global a variable before. So in this instance, it's the UnboundLocalError
# which means you're trying to use a variable that hasn't yet been given a value. (since that happens line 5)