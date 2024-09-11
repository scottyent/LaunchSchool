# When the user inputs 10, we expect the program to print The result is 50!, but
# that's not the output we see. Why not?

def multiply_by_five(n):
    return n * 5

print("Hello! Which number would you like to multiply by 5?")
number = int(input())

print(f"The result is {multiply_by_five(number)}!")

# The issue is that input() gives you a string, not an integer. The expectation
# in the multiply_by_five functios that you're doing math using numbers, but
# you're passing it a string, which simply multiplies that string over and over.

# By type casting the input to an integer, we can get the expected behavior.