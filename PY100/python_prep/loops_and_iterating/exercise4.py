# Use a while loop to print all numbers in my_list with even values,
# one number per line. Then, print the odd numbers using a ' for' loop.

my_list = [6, 3, 0, 11, 20, 4, 17]
index = 0

while index < len(my_list):
    number = my_list[index]
    if number % 2 == 0:
        print(number)
    index += 1

print('\nNow odd numbers in a for loop:\n')

for num in my_list:
    if not num % 2 == 0:
        print(num)

# alternative to both using list comprehensions:

odd_list = [num for num in my_list if not num % 2 == 0]
even_list = [num for num in my_list if num % 2 == 0]

index = 0

while index < len(even_list):
    number = even_list[index]
    print(number)
    index += 1

for num in odd_list:
    print(num)