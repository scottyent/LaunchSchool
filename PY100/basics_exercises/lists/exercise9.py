# The destinations list contains a list of travel destinations.

def contains(place, places_list):
    for destination in places_list:
        if place == destination:
            return True
    return False

destinations = ['Prague', 'London', 'Sydney', 'Belfast',
                'Rome', 'Aruba', 'Paris', 'Bora Bora',
                'Barcelona', 'Rio de Janeiro', 'Marrakesh',
                'New York City']

print(contains('Barcelona', destinations)) # True
print(contains('Nashville', destinations))  # False

# Write a function that, without using the built-in in operator, checks whether
# a specific destination is included within destinations. For example: When
# checking whether 'Barcelona' is contained in destinations, the expected output
# is True, whereas the expected output for 'Nashville' is False.