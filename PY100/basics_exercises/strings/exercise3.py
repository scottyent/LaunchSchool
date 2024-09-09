# Using the following code, compare the value of name with the
# string 'RoGeR' while ignoring the case of both strings. Print true if
# the values are the same; print false if they aren't. Next, perform a
# case-insensitive comparison between the value of name and the string 'DAVE'.

name = 'Roger'

compare1 = 'RoGeR'
compare2 = 'DAVE'

print(name.casefold() == compare1.casefold())
print(name.casefold() == compare2.casefold())