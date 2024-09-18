# Ask the user for the operation they want to perform (+,-,*,/).
# Perform the operation on the two numbers.
# Display the result to the user.

def prompt(text):
    print(f'==> {text}')

print('Welcome to the calculator!')

# Ask the user for the first number.
num1_not_set = True
while num1_not_set:
    prompt('What is the first number?')
    num1 = input()
    try:
        num1 = int(num1)
        num1_not_set = False
    except ValueError:
        prompt('Error: We only accept integers in this calculator! Try again.')


# Ask the user for the second number.
prompt('What is the second number?')
num2 = int(input())

prompt(f'Great! We\'ll be performing an operation with {num1} and {num2}')

# Ask what operation
invalid_operation = True

while invalid_operation:
    prompt("""What operation would you like to perform?

        1) Add 2) Subtract 3) Multiply 4) Divide"""
    )
    operation = input()

    if operation in ['1', '2', '3', '4']:
        invalid_operation = False
    else:
        prompt('Whoopsies! That is not a valid operation. Try again.')

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
        prompt("You didn't choose an appropriate operation!")

prompt(f'The result is: {result}')
