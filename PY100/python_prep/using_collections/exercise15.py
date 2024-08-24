# Without running the following code, what values will be printed by line 10?

pets = {
    'Cat':  'Meow',
    'Dog':  'Bark',
    'Bird': 'Tweet',
}

keys = pets.keys()
del pets['Dog']
pets['Snake'] = 'Sssss'
print(keys)

# It will print out a dict view of the keys - 'Cat', 'Bird', and 'Snake'
# because in using pets.keys(), you're creating a view object that is
# directly referencing the dictionary itself rather than creating a copy
# so whatever has changed in the dictionary, will reflect in that stored object
# which in this case is called 'keys'