# Write a program that uses a multiply function to multiply two numbers and returns the result. Ask the user to enter the two numbers, then output the numbers and result as a simple equation.
# 
# $ python multiply.py
# Enter the first number: 3.1416
# Enter the second number: 2.7183
# 3.1416 * 2.7183 = 8.53981128

def multiply(num1, num2): 
    return num1 * num2

first_num = float(input('Enter the first number: '))
second_num = float(input('Enter the second number: '))
print(f'{first_num} * {second_num} = {multiply(first_num, second_num)}')
