# Without running this code, what will it print? Why?

dict1 = {
    "Hitchhiker's Guide to the Galaxy": 42,
    'Monty Python': 'The Life of Brian',
    'Airplane!': "Don't call me Shirley!",
}

dict2 = dict(dict1)
dict2['Monty Python'] = 'Holy Grail'
print(dict1['Monty Python'])

# This will print 'The Life of Brian' - the reason for this is that constructors
# generally create a shallow copy of an object, but that's all that's needed
# here since there are no nested and mutable objects inside this dictionary.
# When reassning the value of the key 'Monty Python' in dict2, you are changing
# the value in a completely separate object, and dict1 is not affected.