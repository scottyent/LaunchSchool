# What will the following code print and why? Don't run it until you have tried to answer.

num = 5

def my_func():
    global num
    num = 10

my_func()
print(num)

# Since the global keyword was used on line 6, you're telling python that within
# that function you're actually using the global num variable, not using a local
# variable, so when you assign a value on line 7, it's actually re-assigning
# the value for teh global variable num. As such, when print is called on line 10
#, 10 will be printed.