# What do you think the following code will output?

nan_value = float("nan")

print(nan_value == float("nan"))

# Oof, I think it'll print True. because I believe passing 'nan' into float
# returns nan, and the print statement is straight up comparing the return value
# of the same expression, with the variable that stored that result.

# Nope, it is false. Interesting. It also evaluates to a float type, but prints
# nan.

# Bonus Question

# How can you reliably test if a value is nan?

# I found a brief statement online, but didn't dig into it, but tested it.
# Testing to see if an item is equal to itself, and coming out false, can show
# that it's nan. So when you would do nan_value == nan_value, which is literally
# the same variable, you'd get false.

# Apparently importing math and using math.isnan(value_you_want_to_test) is a
# way to verify if it's a nan value.