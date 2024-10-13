# What do you expect to happen when the greeting variable is referenced in the
# last line of the code below?

if False:
    greeting = "hello world"

print(greeting)

# I expect to get a NameError, because greeting is not defined. Since the False
# guarantees that the if block will not execute, the variable greeting will
# never be initialized, and then available for the print statements.