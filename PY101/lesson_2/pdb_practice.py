# # debug.py

# import pdb

# counter = 1
# task = 'this is a value'

# while counter <= 2:
#     print(counter)
#     pdb.set_trace()  # Add breakpoint
#     counter += 1

file = open('filename.txt', 'r')

try:
    contents = file.read()
except PermissionError:
    print('You do not have permission to read this file. ')
except Exception as e:
    print(f"An error occurred: {e}")
else:
    print(contents)
finally:
    file.close()