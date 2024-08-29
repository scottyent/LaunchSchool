# In your own words, explain the difference between these two expressions.

my_object1 == my_object2
my_object1 is my_object2

# The first line is evaluating if two objects contain the same elements. For
# example, if it's a list, it'll compare element by element to check that they
# evaluate to the same values until it's checked the whole list and found
# no discrepencies.

# The second line is asking if object1 literally is object2, not if they have
# the same values, but rather are they the exact same object at the same
# place in memory.

# To use an analogy, the first option is checking if two cars have all the
# same features, same model, same color, etc. Two identical cars.
# The second option if two representations of the car are actually pointing
# to one car that exists. It's not two separate things, it's just the one car.