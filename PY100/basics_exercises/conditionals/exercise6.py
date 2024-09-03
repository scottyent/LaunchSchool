# Take your code from the previous Check the Weather exercise and
# rewrite it as a match-case statement. Feel free to add more cases
# besides 'sunny' and 'rainy'.

# I already wrote it as a match-case statement so I'll paste that here:

import random

weather = random.choice(['sunny', 'rainy', 'snowy', 'foggy', 'icy'])

match weather:
    case 'sunny':
        print("It's a beautiful day!")
    case 'rainy':
        print("Grab your umbrella.")
    case 'icy':
        print("Don't forget your winter boots!")
    case _:
        print("Let's stay inside.")
