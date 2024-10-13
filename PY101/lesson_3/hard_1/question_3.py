# Given the following similar sets of code, what will each code snippet print?

# A:
def mess_with_vars(one, two, three):
    one = two
    two = three
    three = one

one = ["one"]
two = ["two"]
three = ["three"]

mess_with_vars(one, two, three)

print(f"one is: {one}")
print(f"two is: {two}")
print(f"three is: {three}")

# This will print:
# one is one
# two is two
# three is three

# Because, the function that is called isn't mutating anything so there are no
# effects

# B:
def mess_with_vars(one, two, three):
    one = ["two"]
    two = ["three"]
    three = ["one"]

one = ["one"]
two = ["two"]
three = ["three"]

mess_with_vars(one, two, three)

print(f"one is: {one}")
print(f"two is: {two}")
print(f"three is: {three}")

# This will print:
# one is one
# two is two
# three is three

# Because, the function that is called isn't mutating anything so there are no
# effects

# C:
def mess_with_vars(one, two, three):
    one[0] = "two"
    two[0] = "three"
    three[0] = "one"

one = ["one"]
two = ["two"]
three = ["three"]

mess_with_vars(one, two, three)

print(f"one is: {one}")
print(f"two is: {two}")
print(f"three is: {three}")

# This one will print:
# one is two
# two is three
# three is one

# Because you're passing the reference to the list in memory, and assignment
# notation with a list will mutate the original list that it's pointing to.