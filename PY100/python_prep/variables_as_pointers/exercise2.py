# Without running this code, what will it print? Why?

set1 = {42, 'Monty Python', ('a', 'b', 'c')}
set2 = set1
set1.add(range(5, 10))
print(set2)

# Don't worry about having an exact match for the output. The important
# part is to show something that accurately represents set2.

# This will output the set (in whatever order it comes, sets aren't ordered)
# and it will include the added range object of range(5, 10). variable set1
# and variable set2 are both referencing the same object in memory, so when
# we mutate using the add function, we actuallly mutate the object for both
# referencing variables.