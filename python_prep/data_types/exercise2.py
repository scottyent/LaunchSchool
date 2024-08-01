num = 4936

thousands = num // 1000

num -= thousands * 1000

hundreds = num // 100

num -= hundreds * 100

tens = num // 10

num -= tens * 10

ones = num

print(f'Ones place is {ones}') 
print(f'Tens place is {tens}') 
print(f'Hundreds place is {hundreds}') 
print(f'Thousands place is {thousands}') 
