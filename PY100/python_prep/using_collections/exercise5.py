# Which of the following values can't be used as a key in a dict object, and why?

'cat' # Yes, immutable
(3, 1, 4, 1, 5, 9, 2) # Yes, immutable
['a', 'b'] # No, mutable
{'a': 1, 'b': 2} # No, mutable
range(5) # Yes? Technically immutable
{1, 4, 9, 16, 25} # No, mutable,  would be OK if it were frozen set
3 # Yes
0.0 # Yes
frozenset({1, 4, 9, 16, 25}) # Yes, not mutable

# The key needs to be a hashable object, which so far I have undersatnd to mean
# immutable.