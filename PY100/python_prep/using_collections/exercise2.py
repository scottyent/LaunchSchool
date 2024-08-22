# Use slicing to write Python code to print a 6-character substring of
# 'Launch School' that begins with the first c.

word = 'Launch School'

first_index = word.index('c')
print(word[first_index:first_index + 6])

# Note: this works because we are talking about the FIRST occurance
