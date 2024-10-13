# What does the last line in the following code output?

dictionary = {'first': [1]}
num_list = dictionary['first']
num_list.append(2)

print(num_list)
print(dictionary)

# I would say that it will print a dictionary that includes {'first':[1, 2]}
# because the num_list is referencing the list that exists as a data value
# inside dictionary. When it is mutated, anywhere that points to that list in
# memory wil reflect that change, so dictinoary changes.