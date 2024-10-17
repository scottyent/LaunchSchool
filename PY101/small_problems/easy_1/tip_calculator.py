# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip, then print both the tip
# and the total amount of the bill. You can ignore input validation and assume
# that the user will enter valid numbers.

# Example:
# What is the bill? 200
# What is the tip percentage? 20

# The tip is $40.00
# The total is $240.00

print(f'Welcome to the tip calculator! Please use valid numbers\U0001F972')
bill = float(input('What is the bill (without symbols)?: '))
tip_percent = float(input('What is the tip percentage (full number)?: '))
tip_amount = bill * (tip_percent / 100)
total = bill + tip_amount

print(f'The tip is ${tip_amount:.2f}')
print(f'The total bill is ${total:.2f}')