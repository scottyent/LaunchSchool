# To what value does the following expression evaluate?
# '12' < '9'

# This will evaluate to true, because when comparing strings, it goes one by one
# and stops once it finds the condition it's looking for. In this case, the string
# 1 evalutes to the ordinal value of 49, and the string character 9 evaluates to 57.
# Since 49 is less than 57, it immediately returns true and stops comparison further.

print('12' < '9')

