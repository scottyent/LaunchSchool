# Without running the following code, determine what it will print:

def multiples_of_three():
    divisor = 1

    for dividend in range(3, 31, 3):
        print(f'{dividend} / {divisor} = 3')
        divisor += 1

multiples_of_three

# If this printed using the forumula, it would print 1, 2, 3 etc but it will
# actually just print the dividend and divisor equals 3 every time. It's not
# an actual formula, it's a static print statement, that will insert the
# values of dividend and divisor each round.

# Well, I was right IF it was an actual method call which it wasn't. The call
# on line 10 was missing the () to make it a function call.