# Use the Python documentation for the str class to determine which method
# can be used to right justify a str object.

# str.rjust(width[, fillchar]) will right justify a string object by allowing
# you to give the width and the filling character as arguments. For example,
# let's say that you have a string of width 5 ('hello') and you called
# str.rjust on it, and you give in 10 and * as the arguements. You'd get a
# returned stringt that's 10 characters long, starting with 5 * and then hello
# on the right. If the width is shorter than the string, it returns the original
# string. Since strings cannot be mutated, this is returning a new string.

# Docs here: https://docs.python.org/3/library/stdtypes.html#str.rjust