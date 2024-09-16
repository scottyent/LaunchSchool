# Print all odd numbers from 1 to 99, inclusive, with each number on a separate line.

# Bonus Question: Can you solve the problem by iterating over just the odd numbers?

# for num in range(1, 100):
#     if num % 2 == 1:
#         print(num)

# # For the bonus:
# for num in range(1, 100, 2):
#     print(num)

# Further Exploration
# Consider adding a way for the user to specify the starting and ending values
# of the odd numbers printed.

print('Welcome to the Odd Number Printer\u2122!')
print('Disclaimer: only integers are accepted!')
beginning = None
end = None

while not beginning:
    try:
        beginning = int(input('What number would you like to count from?\n'))
    except:
        print("Oops, that's not an integer! Try again.")

print(f'Thanks! We\'ll start counting from {beginning}.')

while not end:
    try:
        end = int(input('What number would you like to count until?\n'))
    except:
        print("Oops, that's not an integer! Try again.")

print(f'Perfect! We will count odd numbers up until {end}:')

for num in range(beginning, end + 1):
    # I chose this method because I'm not verifying if an odd start number was
    # was given, so I figured it was easier just to disregard the first number
    # if it wasn't odd and iterate through the full range.
    if num % 2 == 1:
        print(num)

# A bit overengineered for this problem, and doesn't consider all edge cases
# like what if the end is lower than the beginning number.