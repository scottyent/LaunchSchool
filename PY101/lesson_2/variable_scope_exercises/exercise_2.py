# What will the following code print and why? Don't run it until you have tried to answer.

num = 5

def my_func():
    num = 10

my_func()
print(num)

# This will print once again the number 5. While the global num, assigned to 5,
# is accessible within the my_func function, because we use assignment on line 6
# it's actually creating a new local variable called num (shadowing the global)
# and assigning it the value of 10. Because that's only accessible inside the function
# on line 9, when we print, it will take the global variable value of 5 and output it.