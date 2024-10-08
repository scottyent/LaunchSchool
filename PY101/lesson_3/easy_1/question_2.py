# How can you determine whether a given string ends with an exclamation mark (!)?
# Write some code that prints True or False depending on whether the string
# ends with an exclamation mark.

def end_in_exclamation(text):
    if not isinstance(text, str):
        return None
    return text.endswith('!')

str1 = "Come over here!"  # True
str2 = "What's up, Doc?"  # False

print(end_in_exclamation(str1))
print(end_in_exclamation(str2))