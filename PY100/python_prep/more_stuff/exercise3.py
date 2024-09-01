# Consider the following code:

def sum_of_squares(num1, num2):
    def square(num):
        return num * num

    return square(num1) + square(num2)

print(sum_of_squares(3, 4))   # 25 (3 * 3 + 4 * 4)
print(sum_of_squares(5, 12))  # 169 (5 * 5 + 12 * 12)

# Write a nested function in sum_of_squares that will make this code work as shown.