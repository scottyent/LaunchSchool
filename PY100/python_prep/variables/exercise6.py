# Write a program named age.py that includes someone's age and then calculates and reports the future age 10, 20, 30, and 40 years from now. Here's the output for someone who is 22 years old.

# Expected output: You are 22 years old.
# In 10 years, you will be 32 years old.
# In 20 years, you will be 42 years old.
# In 30 years, you will be 52 years old.
# In 40 years, you will be 62 years old.

age = int(input('How old are you?\n'))
difference = int(input('How big do you want the year jumps to be?\n'))

print(f'In {difference} years, you will be {age + difference} years old.')
print(f'In {2 * difference} years, you will be {age + (2 * difference)} years old.')
print(f'In {3 * difference} years, you will be {age + (3 * difference)} years old.')
print(f'In {4 * difference} years, you will be {age + (4 * difference)} years old.')
