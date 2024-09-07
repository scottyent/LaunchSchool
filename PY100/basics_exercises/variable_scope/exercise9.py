a = 7

def my_function(b):
    b += 10

my_function(a)
print(a)

# this is a great question. so when you pass a in as an argument, it's really
# passing the pointer, which is pointing to the value of 7. that pointer then
# gets assigned to b, so be = 7. in that case, a and b are pointing to the same
# object, but are not the same object (well, they are in that 7 is the same object
# in memory I believe).

# So I think this will print 7. It did!

# Remaking this with a mutable object, because the explanation at LaunchSchool
# specifically called out that the integer value is immutable which is what
# caused this behavior. What about with something mutable:

a = [1, 2, 3]

def my_function(b):
    b += [4]

my_function(a)
print(a)

# I think this will print 1,2,3,4 because the pointer that's being passed around
# is to a mutable object, so the changes made in the function change the value
# everywhere.