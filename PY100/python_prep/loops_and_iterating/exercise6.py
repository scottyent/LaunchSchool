# We'll return to the simpler one-dimensional version of my_list. In this
# problem, you should write code that creates a new list with one element
# for each number in my_list. If the original number is an even, then the
# corresponding element in the new list should contain the string 'even';
# otherwise, the element should contain 'odd'.

# def is_even(number):
#     return (number % 2) == 0

def odd_or_even(number):
    return 'even' if number % 2 == 0 else 'odd'

my_list = [
    1, 3, 6, 11,
    4, 2, 4, 9,
    17, 16, 0,
]

# text_list = []

# expected output:
#  pretty-printed for clarity
# [
#     'odd', 'odd', 'even', 'odd',
#     'even', 'even', 'even', 'odd',
#     'odd', 'even', 'even'
# ]

# for num in my_list:
#     if is_even(num):
#         text_list.append('even')
#     else:
#         text_list.append('odd')

# print(text_list)

# rewriting with the odd_or_even helper function they described, for practice

text_list = [odd_or_even(num) for num in my_list]
print(text_list)