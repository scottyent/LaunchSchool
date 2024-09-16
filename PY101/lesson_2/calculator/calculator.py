# Ask the user for the operation they want to perform (+,-,*,/).
# Perform the operation on the two numbers.
# Display the result to the user.

print('Welcome to the calculator!')

# Ask the user for the first number.
num1 = int(input('What is the first number?\n'))

# Ask the user for the second number.
num2 = int(input('What is the second number?\n'))

print(f'Great! We\'ll be performing an operation with {num1} and {num2}')

# operation = input('What operation would you like to perform?\n 1) Add 2) Subtract 3) Multiply 4) Divide')
operation = input(
    'What operation would you like to perform?\n'
    '1) Add 2) Subtract 3) Multiply 4) Divide\n'
)

match operation:
    case '1':
        result = num1 + num2
    case '2':
        result = num1 - num2
    case '3':
        result = num1 * num2
    case '4':
        result = num1 / num2
    case _:
        print("You didn't choose an appropriate operation!")

print(f'The result is: {result}')