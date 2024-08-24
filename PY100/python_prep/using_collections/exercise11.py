# Without running the following code, determine what each line should print.

print('johnson' in 'Joe Johnson') # False, case sensitive
print('sen' not in 'Joe Johnson') # True
print('Joe J' in 'Joe Johnson') # True
print(5 in range(5)) # False, ranges go up to but don't include the final number
print(5 in range(6)) # True
print(5 not in range(5, 10)) # False, starting argument is included
print(0 in range(10, 0, -1)) # False, 0 is the last element and not included
print(4 in {6, 5, 4, 3, 2, 1}) # True
print({1, 2, 3} in {1, 2, 3}) # False because you're comparing if the left item is an element IN the right item, and this is just showing equal sets
print({3, 2} in {1, frozenset({2, 3})}) # True, because sets are unordered collections and apparently frozensets do have equality with unfrozen sets (if they're the same)