# You come across the following code. What errors does it raise for the given
# examples and what exactly do the error messages mean?

def find_first_nonzero_among(numbers):
    for n in numbers:
        if n != 0:
            return n

find_first_nonzero_among(0, 0, 1, 0, 2, 0)
find_first_nonzero_among(1)

# The error is a TypeError, and it is specifically telling you that the function
# find_first_nonzero_among() was defined to accept a singuler positional argument
# but it was called on line 9 with 6 arguments. In Python, the amount of arguments
# given must match the amount of parameters defined in the function definition.