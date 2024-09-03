# Examine the code shown below. Without running it, determine what it will print.
# If you're not sure, refer to our Python book.

animal = 'horse'

match animal:
    case 'duck':
        print('quack')
    case 'squirrel':
        print('nook nook')
    case 'horse':
        print('neigh')
    case 'bird':
        print('tweet tweet')
    case _:
        print('*cricket*')

# It will print neigh since the case 'horse' matches the value of what we're
# testing (the animal variable)