# Using the multiply function from the "Multiplying Two Numbers" exercise, write a function that computes the square of its argument (the square is the result of multiplying a number by itself).

def multiply(num1, num2):
    return num1 * num2

def power_to_n(num, exponent):
    result = 1

    for power in range(0, exponent):
        result = multiply(result, num)

    return result

# print(square(5) == 25)   # True
# print(square(-8) == 64)  # True

# Further Exploration
# Suppose we want to generalize this function to a "power to the n" type function: cubed, to the 4th power, to the 5th, etc. How would we go about doing so while still using the multiply function?

print(power_to_n(3, 3) == 27)   # True
print(power_to_n(5, 6) == 15625)  # True
print(power_to_n(8, 5) == 32768)  # True
print(power_to_n(9, 1) == 9)  # True
print(power_to_n(9, 0) == 1)  # True
