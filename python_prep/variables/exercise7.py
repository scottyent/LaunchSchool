# What happens when you run the following code? Why?

NAME = 'Victor'
print('Good Morning, ' + NAME)
print('Good Afternoon, ' + NAME)
print('Good Evening, ' + NAME)

NAME = 'Nina'
print('Good Morning, ' + NAME)
print('Good Afternoon, ' + NAME)
print('Good Evening, ' + NAME)

# Both will print out appropriately using the most recent name (reassigned for the second half to the string 'Nina'
# and will use string concatenation to make them full sentences e.g. 'Good morning, Victor'
# That fact that visually we can confirm these SHOULD be constants and not reassigned, Python doesn't stop you
# from reassigning the variable. 
