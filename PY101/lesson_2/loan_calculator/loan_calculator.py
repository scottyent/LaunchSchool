def prompt(text):
    print(f'=> {text}')

def valid_input(user_text):
    try:
        float(user_text)
        return True
    except ValueError:
        return False

def extract_digits(unfiltered_text):
    digits_only = ''
    char_lst = list(unfiltered_text)
    for char in char_lst:
        if char.isdigit() or char == '.':
            digits_only += char

    return digits_only

prompt('Welcome to the loan calculator!')

while True:
    # Get loan amount from user
    prompt('What is your loan amount?')
    loan_amount = extract_digits(input())

    while True:
        if valid_input(loan_amount):
            loan_amount = float(loan_amount)
            break
        prompt("That's not a valid loan amount. Follow format $1,234.56")
        loan_amount = extract_digits(input())

    # Get APR from user
    prompt('What is your APR rate?')
    apr_rate = extract_digits(input())

    while True:
        if valid_input(apr_rate):
            apr_rate = float(apr_rate) / 100
            break
        prompt("That's not a valid APR amount. Follow format 4% or 4.5%")
        apr_rate = extract_digits(input())

    # Get loan duration from user
    prompt('How many years is your loan for?')
    loan_years = extract_digits(input())

    while True:
        if valid_input(loan_years):
            loan_years = float(loan_years)
            break
        prompt("That's not a valid loan period. Follow the format: 30 years")
        loan_years = extract_digits(input())

    monthly_interest = apr_rate / 12
    loan_months = loan_years * 12

    monthly_payment = loan_amount * (monthly_interest / (1 - \
                                    (1 + monthly_interest) ** (-loan_months)))

    prompt(f'Your monthly payment is: ${monthly_payment:.2f}')

    prompt('Do you want to do another calculation? y/n')
    calculate_again = input().casefold()

    while True:
        if calculate_again in ['y', 'n']:
            break
        prompt('Please put in y or n')
        calculate_again = input().casefold()

    if calculate_again == 'n':
        prompt('Thanks for using the loan calculator!')
        break

# Future features
# 1. Reformat the number appropriately in USD (e.g. 1000.22 -> $1,000.22)
# 2. The extraction of text maybe makes it a little TOO flexible
# for example, you could submit "3rwfwefsf23423fesf" and it would
# pull out the digits. Maybe the extraction could happen at a different time.
# 3. It doesn't filter out negative numbers.

# Formal pseudocode
# START
#
# SET loan variable equal to GET loan amount from user
# WHILE invalid loan number
    # explain what a valid loan number is
    # ask for new number

# SET APR variable equal to GET APR from user
# WHILE invalid apr number
    # explain what a valid APR number is
    # ask for new number

# SET loan_length equal to GET loan lenght IN YEARS from user
# WHILE invalid length
    # explain a valid loan length number
    # ask for new number

# SET monthly_interest equal to the APR divided by 12.
# SET loan_months equal to loan_length x 12

# SET loan variable equal to GET loan amount from user