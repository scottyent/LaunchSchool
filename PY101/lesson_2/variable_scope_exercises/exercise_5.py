def my_func():
    num = 10

my_func()
print(num)

# This will raise a NameError: 'num' is not defined. The reason for this is that
# due to how variable scope works in Python, the variable `num` is only accessible
# within the function that it is defined in. Since on line 5 we are attepmting
# to print and access it in the global scope, this will fail as there isn't
# a variable named `num` defined in the global scope.