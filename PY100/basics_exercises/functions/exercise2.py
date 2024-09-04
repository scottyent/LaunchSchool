# Write a function that prints Bruce Eckel's quote 'Python is executable
# pseudocode.'. What is the return value of the function?

def bruce_eckel_quote():
    print("Python is executable pseudocode.")

bruce_eckel_quote()

# I believe the return value is None, because that's what Print returns.
# However, that's how it worked in Ruby, not sure about Python.

# Let's give it a whirl:

result_value = bruce_eckel_quote()
print(result_value)

# Ok so this was correct, but I had to look up some additional answers. Python
# just returns None if there isn't an explicit return value, it's not working
# in the same way that Ruby is (returns the last evaluated value in the function)
