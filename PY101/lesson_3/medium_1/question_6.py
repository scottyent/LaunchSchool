answer = 42

def mess_with_it(some_number):
    return some_number + 8

new_answer = mess_with_it(answer)

print(answer - 8)

# This will print 34. Integers are not mutable anyway, but nothing that is done
# in the code takes an action that would attempt to modify the original variable.
# As a matter of fact, lines 3-6 do absolutely nothing related to what this code
# will output, since the print statement is simply references `answer`.