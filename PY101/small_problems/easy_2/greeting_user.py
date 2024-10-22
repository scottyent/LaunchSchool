# Write a program that asks for user's name, then greets the user. If the user appends a ! to their name, the computer will yell the greeting (print it using all uppercase).

# What is your name? Sue
# Hello Sue.

# What is your name? Bob!
# HELLO BOB! WHY ARE WE YELLING?

def greet_user(name):
    if not name:
        return None

    if name.endswith('!'):
        return f"HELLO {name.upper()} WHY ARE WE YELLING?"
    else:
        return f"Hello {name}."


user_name = input('What is your name? ')
greeting = greet_user(user_name)
print(greeting)