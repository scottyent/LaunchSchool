# What does the following code print?

def scream(words):
    return words + '!!!!'

scream('Yipeee')

# This will not print anything, but it will return the string value Yipeee!!!
# This is because we don't actually call print, or another function to output anything
# to the screen. We simply reurn the result of the string concatenation as a return value.
