# Ask the user for the operation they want to perform (+,-,*,/).
# Perform the operation on the two numbers.
# Display the result to the user.

def prompt(text):
    print(f'==> {text}')

def valid_number(str_int):
    try:
        int_result = int(str_int)
        return int_result, True
    except ValueError:
        prompt('Error: We only accept integers in this calculator! Try again.')
        return str_int, False

def invalid_operation(operation_str):
    return not operation_str in ['1', '2', '3', '4']

print('Welcome to the calculator!')

# Ask the user for the first number.
num1_not_set = True # pylint: disable-msg=C0103
while num1_not_set:
    prompt('What is the first number?')
    num1 = input()
    num1, is_valid = valid_number(num1)
    if is_valid:
        num1_not_set = False # pylint: disable-msg=C0103

# Ask the user for the second number.
num2_not_set = True # pylint: disable-msg=C0103
while num2_not_set:
    prompt('What is the second number?')
    num2 = input()
    num2, is_valid = valid_number(num2)
    if is_valid:
        num2_not_set = False # pylint: disable-msg=C0103

prompt(f'Great! We\'ll be performing an operation with {num1} and {num2}')

# Ask what operation
prompt("""What operation would you like to perform?
    1) Add 2) Subtract 3) Multiply 4) Divide"""
    )
operation = input()

while invalid_operation(operation):
    prompt('Whoopsies! That is not a valid operation. Try again.')
    operation = input()

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
