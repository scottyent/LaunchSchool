# Rewrite car as a list of lists in which each nested list contains two elements
# that represent the corresponding key/value pairs.

car = {
    'type':  'sedan',
    'color': 'blue',
    'year':  2003,
}

new_car = [[item, item2] for item, item2 in car.items()]
print(new_car)