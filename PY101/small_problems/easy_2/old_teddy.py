import random

name_from_user = input('What is your name? ')
name = name_from_user if name_from_user else "Teddy"
age = random.choice(range(20, 101))

print(f'{name} is {age} years old!')

# Further Exploration
# Modify this program to ask for a name, then print the age for that person.
# For an extra challenge, use "Teddy" as the name if no name is entered.
