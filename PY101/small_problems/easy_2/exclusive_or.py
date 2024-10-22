# The or operator returns a truthy value if either or both of its operands are
# truthy, a falsy value if both operands are falsy. The and operator returns a
# truthy value if both of its operands are truthy, and a falsy value if either
# operand is falsy. This works great until you need only one of two conditions
# to be truthy, the so-called exclusive or, also known as xor
# (pronounced "ECKS-or").

# In this exercise, you will write an xor function that takes two arguments,
# and returns True if exactly one of its arguments is truthy, False otherwise.

# def xor(*args):
#     boolean_values = [bool(item) for item in args]
#     return (boolean_values.count(True) == 1)

# While I like this solution because I got to try *args, I suppose it's not
# really the spirit of what args is used for (variable amount of input). I
# don't actually need the flexibility here as xor should take exactly two
# arguments. Using similar logic though, I'd re-write it like this:

def xor(arg1, arg2):
    boolean_values = [bool(arg1), bool(arg2)]
    return (boolean_values.count(True) == 1)

# LS implementation which I'm going to use to test short circuiting
# def xor(value1, value2):
#     return bool((value1 and not value2) or (print('this executed)')))

print(xor(5, 0) == True)
print(xor(False, True) == True)
print(xor(1, 1) == False)
print(xor(True, True) == False)