# Write a function that takes one argument, a positive integer, and returns a
# string of alternating '1's and '0's, always starting with a '1'. The length
# of the string should match the given integer.

# set a result word equal to 1, since it always starts with one.
# iterate over range 0 to length - 1 (since we already added the first item)
# then use a ternary to say += 1 if word[-1] == 0 else 1
# return result

def stringy(length):
    result = '1'

    for _ in range(length - 1):
        result += '1' if result[-1] == '0' else '0'

    return result

def stringy(length):
    return (((length // 2) + 1) * "10")[:length]

print(stringy(6) == "101010")           # True
print(stringy(9) == "101010101")        # True
print(stringy(4) == "1010")             # True
print(stringy(7) == "1010101")          # True