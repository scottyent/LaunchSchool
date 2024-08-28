# Write a find_integers function that returns a list of all the
# integers from my_tuple:

def find_integers(data):
    return [item
            for item in data
            if type(item) is int]


my_tuple = (1, 'a', '1', 3, [7], 3.1415,
            -4, None, {1, 2, 3}, False)
integers = find_integers(my_tuple)
print(integers)                    # [1, 3, -4]