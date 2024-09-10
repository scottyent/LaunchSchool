# Write a function that returns the last element of a list provided as an
# argument. For example:

def last(collection):
    if collection:
        return collection.pop()
    else:
        return "Empty List"

print(last(['Earth', 'Moon', 'Mars']))  # Mars
print(last([]))  # "Empty List"