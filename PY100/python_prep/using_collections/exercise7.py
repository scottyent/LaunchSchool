# Write Python code to replace all the : characters in the string below with +.

info = 'xyz:*:42:42:Lee Kim:/home/xyz:/bin/zsh'

# Try this problem using the methods you've learned about in this chapter.
# Once you have that working, use the Python documentation for the str type
# to find an alternative solution.

# removal = info.split(':')
# addition = '+'.join(removal)
# print(addition)

# ok, now using what I found in the docs:
print(info.replace(':', '+'))