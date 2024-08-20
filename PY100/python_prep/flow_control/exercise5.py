# What does this code output, and why?

def is_list_empty(my_list):
    if my_list:
        print('Not Empty')
    else:
        print('Empty')

is_list_empty([])

# It will print out 'Empty' because the function is taking the argument
# and using an if statement to check if the value is empty or not.
# In this scenario, we pass an empty liss in as an argument, and since an
# empty list evaluates to false, it would fail the 'if' statement and go to
# 'else' and print out 'Empty'