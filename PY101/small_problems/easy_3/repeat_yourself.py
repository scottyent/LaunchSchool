# Write a function that takes two arguments, a string and a positive integer,
# then prints the string as many times as the integer indicates.

def repeat(text, loop):
    for _ in range(loop):
        print(text)

repeat('Hello', 3)

# Hello
# Hello
# Hello