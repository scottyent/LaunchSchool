# Write a function that returns a list that contains every other element of a
# list that is passed in as an argument. The values in the returned list should
# be those values that are in the 1st, 3rd, 5th, and so on elements of the
# argument list.

# def oddities(lst):
#     odd_items = []

#     for index, item in enumerate(lst):
#         if index % 2 == 0:
#             odd_items.append(item)

#     return odd_items

# Bonus question: Try to solve the problem using list slicing.

def oddities(lst):
    return lst[::2]

print(oddities([2, 3, 4, 5, 6]) == [2, 4, 6])  # True
print(oddities([1, 2, 3, 4]) == [1, 3])        # True
print(oddities(["abc", "def"]) == ['abc'])     # True
print(oddities([123]) == [123])                # True
print(oddities([]) == [])                      # True


# Further Exploration
# Write a companion function that returns the 2nd, 4th, 6th, and
# so on elements of a list.

# Try to solve this differently from the exercise described above.
# def evens(lst):
#     return lst[1::2]

# I already solved it a bit differently with enumerate, but let's try another:
def evens(lst):
    evens_list = []
    for item in lst:
        if lst.index(item) % 2 != 0:
            evens_list.append(item)

    return evens_list

print(evens([2, 3, 4, 5, 6]) == [3, 5])  # True
print(evens([1, 2, 3, 4]) == [2, 4])        # True
print(evens(["abc", "def"]) == ['def'])     # True
print(evens([123]) == [])                # True
print(evens([]) == [])                      # True