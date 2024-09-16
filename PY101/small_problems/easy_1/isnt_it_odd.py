# Write a function that takes one integer argument and returns True when the
# number's absolute value is odd, False otherwise.

def is_odd(num):
    return num % 2 == 1

# Test Cases & Expected Outcomes
print(is_odd(3))         # True
print(is_odd(80))        # False
print(is_odd(101))       # True
print(is_odd(1_000_000)) # False
print(is_odd(2_000_001)) # True