import time

number1 = float(input("What's the first number?: "))
print('Thanks!')

number2 = float(input("What's the second number?: "))

print('Perfect. Cooking up some math...')
print('.')
time.sleep(1)
print('..')
time.sleep(2)
print('...')
time.sleep(1)
print(f'{number1} + {number2} = {number1 + number2:.2f}')

