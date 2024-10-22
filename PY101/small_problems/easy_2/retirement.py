from datetime import date

def get_valid_age(message):
    while True:
        str_age = input(message)

        try:
            int_age = int(str_age)
            if int_age < 0:
                print('You have to be older than 0 years old!')
            else:
                break
        except ValueError:
            print('That is not a valid age. Use whole integers please.')
    return int_age

def get_retirement_age(current_age):
    while True:
        retirement_age = get_valid_age('What age do you want to retire?: ')

        if retirement_age < current_age:
            print('Sadly, you cannot retire in the past!')
        elif retirement_age not in range(age, age + 100):
            print("That's a bit too far in the future...")
        else:
            break
    return retirement_age

age = get_valid_age('How old are you?: ')
target_age = get_retirement_age(age)
current_year = date.today().year
years_left = target_age - age

if years_left == 0:
    print('Congrats, you\'ll be retiring this year!')
else:
    print(f"It's {current_year}. You will retire in {current_year + years_left}.")
    print(f'You have only {years_left} years to go!')



# What is your age? 30
# At what age would you like to retire? 70

# It's 2024. You will retire in 2064.
# You have only 40 years of work to go!