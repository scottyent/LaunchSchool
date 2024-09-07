# What will the following code do and why?
# Don't run it until you have tried to answer.

print(greeting)

greeting = 'Hello world!'

# In Ruby this wouldn't have worked. In Python... I'll say it also doesn't work
# though I feel like it might actually if it reads the whole file. Doesn't it work
# that way for functions? you can use them elsewhere regardless of order?
# I'll say NameError not defined.

# Let's test it on function as well;

say_hello()

def say_hello():
    print('hello')

# Ok same issue, can't call it because it wasn't defined just yet.