# What does the following function do? Be sure to identify the output value.

def do_something(dictionary):
    return sorted(dictionary.keys())[1].upper()

my_dict = {
    'Karl':     108,
    'Clare':    175,
    'Karis':    140,
    'Trevor':   180,
    'Antonina': 132,
    'Chris':    101,
}

print(do_something(my_dict))

# It prints the second name, alphabetically, in all upper case (so Chris).
# It takes my_dict as input, and first it uses the keys method to return a
# dictionary view of the keys from my_dict. That return is used in sorted
# which returns a sorted list that then uses index access to
# select the item at the 1st index. It takes that value (Chris), then uses the
# method to upper case it and return that string, that passes it to Print and
# prints it out. Print itself returns a value of None.