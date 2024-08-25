# Modify the age.py program you wrote in Exercise 3 of the Input/Output chapter.
# The updated code should use a for loop to display the future ages.

age = int(input('How old are you?\n'))
difference = int(input('How big do you want the year jumps to be?\n'))

# print(f'In {difference} years, you will be {age + difference} years old.')
# print(f'In {2 * difference} years, you will be {age + (2 * difference)} years old.')
# print(f'In {3 * difference} years, you will be {age + (3 * difference)} years old.')
# print(f'In {4 * difference} years, you will be {age + (4 * difference)} years old.')

# so takes the difference, and calculates that x 4 right. so I want to create
# a range starting at the difference number, going through to 4x difference, but inclusive
# with step the size of the difference. Then iterate over that range, and use
# the current number as the amount of years, and age + that amount of years in
# the formatting.

for years in range(difference, ((difference * 4) + 1), difference):
        print(f'In {years} years, you will be {age + years} years old.')

