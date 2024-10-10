# Write two distinct ways of reversing the list without mutating the original list.

numbers = [1, 2, 3, 4, 5]     # [5, 4, 3, 2, 1]

reversed_list = []
for index in range(len(numbers) - 1, -1, -1):
    reversed_list.append(numbers[index])

print(reversed_list)

second_reversed_list = []
for num in numbers:
    second_reversed_list.insert(0, num)

print(second_reversed_list)

third_reversed_list = numbers.copy()
third_reversed_list.reverse()

print(third_reversed_list)
print(numbers)

# LS Solutions, which are definitely more elegant and straight forward:
reversed_numbers = numbers[::-1]
reversed_numbers = list(reversed(numbers))


