from calculator_messaging import messages

def prompt(text):
    print(f'==> {text}')

def valid_number(str_int):
    try:
        int_result = int(str_int)
        return int_result, True
    except ValueError:
        prompt(messages['invalid_integer'])
        return str_int, False

def invalid_operation(operation_str):
    return not operation_str in ['1', '2', '3', '4']

def calculate_again():
    prompt(messages['continue?'])
    answer = input().casefold()

    while answer not in ['y', 'n']:
        prompt(messages['invalid_response'])
        answer = input()

    return True if answer == 'y' else False

print(messages['greeting'])

continue_calculating = True

while continue_calculating:
    # Ask the user for the first number.
    num1_not_set = True # pylint: disable-msg=C0103
    while num1_not_set:
        prompt(messages['ask_first_number'])
        num1 = input()
        num1, is_valid = valid_number(num1)
        if is_valid:
            num1_not_set = False # pylint: disable-msg=C0103

    # Ask the user for the second number.
    num2_not_set = True # pylint: disable-msg=C0103
    while num2_not_set:
        prompt(messages['ask_second_number'])
        num2 = input()
        num2, is_valid = valid_number(num2)
        if is_valid:
            num2_not_set = False # pylint: disable-msg=C0103

    prompt(messages['confirm_numbers'].format(num1, num2))

    # Ask what operation
    prompt(messages['operation'])
    operation = input()

    while invalid_operation(operation):
        prompt(messages['invalid_operation'])
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


    prompt(messages['result'].format(result))

    if not calculate_again():
        prompt(messages['goodbye'])
        continue_calculating = False
