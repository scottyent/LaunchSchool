b = [1, 2, 3]

def my_function():
    b[0] = 10

my_function()
print(b)

# I don't know. I think it'll print [10, 2, 3] because it's accessing the pointer
# assigned to b and the mutating the object inside, so it's reassigning but not
# the variable itself (which wouldn't work), but rather a value in the mutable
# object that the variable is pointing to.

