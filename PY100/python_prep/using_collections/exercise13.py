# Without running the following code, determine what each print statement
# should print.

cats = ('Cocoa', 'Cheddar',
        'Pudding', 'Butterscotch')
print('Butterscotch' in cats) # True
print('Butter' in cats) # False because it'll do 'Butter' == 'Butterscotch' which is false.
print('Butter' in cats[3]) # True because 'Butter' is in 'Butterscotch
print('cheddar' in cats) # False, case senstive