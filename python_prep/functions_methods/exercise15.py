def multiply(left, right):
    return left * right

def get_num(prompt):
    return float(input(prompt))

first_number = get_num('Enter the first number: ')
second_number = get_num('Enter the second number: ')
product = multiply(first_number, second_number)
print(f'{first_number} * {second_number} = {product}')

# Using the code below, classify the identifiers as global, local, or built-in.
# For our purposes, you may assume this code is the entire program.

# 1: multiply is global, left and right or local. 
# 2: left and right are local
# 4: get_num is global, prompt is local
# 4: float and input are built-in, prompt is local
# 6: first_number is global, get_num is global
# 7: second_number is global get_num is global
# 8: product and multiply are global, first and second number are also global
# 9: print is built in, first second and product are global
