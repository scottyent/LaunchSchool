# Write a function that returns the first element of a list provided as
# an argument. For example:

def first(collection):
    if collection:
        return collection.pop(0)
    else:
        return "Empty List"

print(first(['Earth', 'Moon', 'Mars']))  # Earth
print(first([])) # "Empty list"