# When I come back - try translating some messages from the message dictionary
# then print them out with the placeholders being used in a formatting way
# and see if the placeholder is maintained through the translation, and then
# also works when being formatted in the new language. For example {result}

from calculator_messaging import MESSAGES
from deep_translator import GoogleTranslator

def prompt(text, language='english'):
    if language != 'english':
        text = GoogleTranslator(source='english', target=language).translate(text=text)
    print(f'==> {text}')

def valid_number(str_int, language='english'):
    try:
        int_result = int(str_int)
        return int_result, True
    except ValueError:
        prompt(MESSAGES['invalid_integer'], language)
        return str_int, False

def invalid_operation(operation_str):
    return not operation_str in ['1', '2', '3', '4']

def calculate_again(language='english'):
    prompt(MESSAGES['continue?'], language)
    answer = input().casefold()

    while answer not in ['y', 'n']:
        prompt(MESSAGES['invalid_response'], language)
        answer = input()

    return True if answer == 'y' else False

LANGS_DICT = GoogleTranslator().get_supported_languages(as_dict=True)

prompt(MESSAGES['greeting'])
prompt(MESSAGES['ask_language'])
prompt(MESSAGES['language_format'])
target_language = input().casefold()

while target_language not in LANGS_DICT.keys():
    prompt("That's not a value language. Try again!")
    target_language = input().casefold()

continue_calculating = True

while continue_calculating:
    # Ask the user for the first number.
    num1_not_set = True # pylint: disable-msg=C0103
    while num1_not_set:
        prompt(MESSAGES['ask_first_number'], target_language)
        num1 = input()
        num1, is_valid = valid_number(num1, target_language)
        if is_valid:
            num1_not_set = False # pylint: disable-msg=C0103

    # Ask the user for the second number.
    num2_not_set = True # pylint: disable-msg=C0103
    while num2_not_set:
        prompt(MESSAGES['ask_second_number'], target_language)
        num2 = input()
        num2, is_valid = valid_number(num2)
        if is_valid:
            num2_not_set = False # pylint: disable-msg=C0103

    prompt(MESSAGES['confirm_numbers'].format(num1, num2), target_language)

    # Ask what operation
    prompt(MESSAGES['operation'], target_language)
    operation = input()

    while invalid_operation(operation):
        prompt(MESSAGES['invalid_operation'], target_language)
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


    prompt(MESSAGES['result'].format(result), target_language)

    if not calculate_again(target_language):
        prompt(MESSAGES['goodbye'], target_language)
        continue_calculating = False
