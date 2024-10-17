# Write a program that asks the user to enter an integer greater than 0,
# then asks whether the user wants to determine the sum or the product of
# all numbers between 1 and the entered integer, inclusive.

# Example:
# Please enter an integer greater than 0: 5
# Enter "s" to compute the sum, or "p" to compute the product. s

# The sum of the integers between 1 and 5 is 15.

# ask for an integer, validate it's an integer above 0
# ask for the action you want to take
# create a result variable that is equal to 1
# iterate over the range inclusive of 1 to the number, either multiplying or
# summing as you go.

OPERATIONS = {
    's': "sum",
    'p': "product",
}

def validate_integer(num):
    while not type(num) == int:
        try:
            num = int(num)
        except ValueError:
            num = input('Please choose a valid integer: ')
    return num

def validate_operator(choice):
    while choice not in ['s', 'p']:
        choice = input('That is not a valid option.')
    return OPERATIONS.get(choice)

number = validate_integer(input('Please enter an integer greater than 0: '))

while number <= 0:
    number = validate_integer(input('Please enter an integer greater than 0: '))

operation = validate_operator(input('Enter "s" to compute the sum, or "p" to '
                                     'compute the product: '))

match operation:
    case 'sum':
        result = sum(range(1, number + 1))
    case 'product':
        result = 1
        for num in range(1, number + 1):
            result *= num
    case _:
        print('Something went horribly wrong')

print(f'The {operation} of the numbers between 1 and {number} is {result}')