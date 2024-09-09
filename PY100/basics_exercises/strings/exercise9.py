# Write a function that checks whether a string starts with a specific prefix.

# Write a function that checks whether a string starts with a specific prefix.

def starts_with(text, prefix):
    return text.startswith(prefix)

print(starts_with("launch", "la"))   # True
print(starts_with("school", "sah"))  # False
print(starts_with("school", "sch"))  # True