# What will the following code output?

str1 = "hello there"
str2 = str1
str2 = str1[:2]

print(str1)

# This will print "hello there"
# On line 3, we assign the string literal "hello there" to the variable str1.
# On line 4, we assigned str2 to the value of str1, which is the string literal
# "hello there". They now both have the same value, or rather, are pointing to
# the same object.
# On line 5, we reassign str2 to the value of "goodbye!" - it does not effect
# anything that was previously assigned to the variable, it just breaks that
# connection and assigns a new one.
# Therefore, str1 was never actually changed, and so this will print hello there.