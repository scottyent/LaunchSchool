# Without running this code, what will it print? Why?

dict1 = {
    'a': [1, 2, 3],
    'b': (4, 5, 6),
}

dict2 = dict(dict1)
dict1['a'][1] = 42
print(dict2['a'])

# It will print [1, 42, 3]. The reason for this is that dict() constructor
# executes a shallow copy, which for nested mutable items, essentially just
# copies the pointer, but not the object itself. In line 9, when you're mutating
# the nested list, it is mutating the same nested list that dict2 is referencing