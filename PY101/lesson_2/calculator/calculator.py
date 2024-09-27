from calculator_messaging import MESSAGES
from deep_translator import GoogleTranslator

def prompt(text):
    print(f'==> {text}')

def valid_number(str_int):
    try:
        int_result = int(str_int)
        return int_result, True
    except ValueError:
        prompt(translated_messages['invalid_integer'])
        return str_int, False

def invalid_operation(operation_str):
    return not operation_str in ['1', '2', '3', '4']

def calculate_again():
    prompt(translated_messages['continue?'])
    answer = input().casefold()

    affirmative_first_letter = translated_messages['play_again'][0]
    negative_first_letter = translated_messages['play_again'].split()[1][0]

    while answer not in [affirmative_first_letter, negative_first_letter]:
        prompt(translated_messages['invalid_response'])
        answer = input()

    return True if answer == affirmative_first_letter else False

def convert_all_messages(messages_dict, language):
    translated_result = {}
    for title, content in messages_dict.items():
        translated_result[title] = GoogleTranslator(source='english', target=language).translate(text=content)

    return translated_result

LANGS_DICT = GoogleTranslator().get_supported_languages(as_dict=True)

prompt(MESSAGES['greeting'])
prompt(MESSAGES['ask_language'])
prompt(MESSAGES['language_format'])
target_language = input().casefold()

while target_language not in LANGS_DICT.keys():
    prompt(MESSAGES['invalid_language'])
    target_language = input().casefold()

prompt(MESSAGES['translating'])

translated_messages = convert_all_messages(MESSAGES, target_language)

continue_calculating = True

while continue_calculating:
    # Ask the user for the first number.
    num1_not_set = True # pylint: disable-msg=C0103
    while num1_not_set:
        prompt(translated_messages['ask_first_number'])
        num1 = input()
        num1, is_valid = valid_number(num1)
        if is_valid:
            num1_not_set = False # pylint: disable-msg=C0103

    # Ask the user for the second number.
    num2_not_set = True # pylint: disable-msg=C0103
    while num2_not_set:
        prompt(translated_messages['ask_second_number'])
        num2 = input()
        num2, is_valid = valid_number(num2)
        if is_valid:
            num2_not_set = False # pylint: disable-msg=C0103

    prompt(translated_messages['confirm_numbers'].format(num1, num2))

    # Ask what operation
    prompt(translated_messages['operation'])
    operation = input()

    while invalid_operation(operation):
        prompt(translated_messages['invalid_operation'])
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


    prompt(translated_messages['result'].format(result))

    if not calculate_again():
        prompt(translated_messages['goodbye'])
        continue_calculating = False
