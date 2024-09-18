#  write out pseudocode (both casual and formal) that does the following:

# a function that returns the sum of two numbers

# pseudocode
# get the first number from the user
# Make sure it's a version that you can use (integer)
# get the second number from the user
# Make sure it's a version that you can use (integer)
# create a variable called result and add these two numbers together
# display result to the user

# Formal Pseudocode

# START

# SET variable number one to the return value of:
    # GET number 1 from the user, and turn it into an integer
# SET variable number two to the return value of:
    # GET number 2 from the user, and turn it into an integer
# READ the values from number one and number two
    # SET result variable equal to the sum of those two values
# PRINT the result to the screen

# END

# Program

# num1 = int(input('What is the first number?\n'))
# num2 = int(input('What is the second number?\n'))

# sum_result = num1 + num2

# print(f'\n{sum_result}')

# a function that takes a list of strings, and returns a string that is all
# those strings concatenated together

# pseuodocode

# make a function called join_str and make the parameter a list
# Verify that all contents of the list are in fact strings
# iterate over them and return an error (or save to result) if not a str type
# take that list, and use the join function to bring together all
# the strings, and save that to a result
# return the result

# Formal pseuodcode

# START

# GET list from the user (we'll just make an example SET one at the top)
# WHILE item in the list
    # IF item isn't a string
        # PRINT sorry we can only work with strings
        # RETURN None
# SET result equal to joining the list with a blank space
# RETURN result

# PRINT return from the function

# END

# Programming code

# def join_str(word_lst):
#     for item in word_lst:
#         if not isinstance(item, str):
#             return 'Error, we can only work with strings.'
#     result = ''.join(word_lst)
#     return result

# test_lst = ['this', 'is', 'a', 5, 'of', 'strings']

# print(join_str(test_lst))

# a function that takes a list of integers, and returns a new list with every
# other element from the original list, starting with the first element.
# For instance:

# pseudocode

# create the function every_other that accepts a list
# Initialize a result variable set to an empty list
# create a loop using 2 step, iterating from 0, to the length of the list
# use that as an index to take element in 0, 2, 4 and save it to the result
# return the result

# Formal pseudocode

# START

# SET the result variable equal to an empty list
# WHILE looping through a range, set to 0 to len(list), step 2:
    # READ the value from the list using the range number as index
    # APPEND that to the result variable
# RETURN result

# PRINT result of function call

# END

# Pogramming code

# def every_other(lst):
#     result = []
#     for index in range(0, len(lst), 2):
#         result.append(lst[index])

#     return result

# print(every_other([1,4,7,2,5])) # => [1,7,5]

# a function that determines the index of the 3rd occurrence of a given
# character in a string. For instance, if the given character is 'x' and
# the string is 'axbxcdxex', the function should return 6 (the index of the
# 3rd 'x'). If the given character does not occur at least 3 times, return None.

# pseudocode

# set occurences to 0
# iterate thruogh the string
# check each character against the target character
# when found, iterate the occurences value
# then check if the occurence value is 3
# If it's three, return the index that you're at
# if that condition is never met, return None

# Formal pseudocode

# START

# SET occurences to 0
# WHILE index of range 0 to length of the string
    # SET current character equal to index of string
    # IF current character equals target character
        # increment occurences by one
        # IF occurences is 3
            # return index

# Return None

# END

# programming

# def third_occurence(text, target):
#     occurences = 0

#     for index in range(0, len(text)):
#         current_letter = text[index]
#         if current_letter == target:
#             occurences += 1

#         if occurences == 3:
#             return index

#     return None

# print(third_occurence('axbxcdxex', 'x')) # 6
# print(third_occurence('axbxcd', 'x'))    # None


# a function that takes two lists of numbers and returns the result of merging
# the lists. The elements of the first list should become the elements at the
# even indexes of the returned list, while the elements of the second list
# should become the elements at the odd indexes.
# You may assume that both list arguments have the same number of elements.
# For instance:

# Psueodocode

# take the two lists
# create a new list to save the result in
# iterate through a range that includes the amount of elements in both lists
# on the even indexes of that list take an item from the first list
# on the odd indexes of that list take an item from the second list
# The question is how to control which item? I guess I could POP at index 0
# for each. I'll try that, then try to do it without mutating the originals.

# Formal Pseudocode

# START

# SET result to empty list
# WHILE index < length of list 1 + length of list 2
    # IF index is even:
        # READ from list 1, pop the first element off into result
    # ELIF index is odd:
        # READ from list 2, pop the first element off into result

# RETURN result

# END

# Programming

def is_even(num):
    return num % 2 == 0

def merge(lst1, lst2):
    result = []

    for index in range(0, (len(lst1) + len(lst2))):
        if is_even(index):
            result.append(lst1.pop(0))
        else:
            result.append(lst2.pop(0))

    return result

print(merge([1, 2, 3], [4, 5, 6])) # => [1, 4, 2, 5, 3, 6]