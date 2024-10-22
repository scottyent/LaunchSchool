# Write a function that takes a non-empty string argument and returns the
# middle character(s) of the string. If the string has an odd length, you
# should return exactly one character. If the string has an even length,
# you should return exactly two characters.

def is_even(num):
    return num % 2 == 0

def center_of(text):
    if not text:
        return None

    text_length = len(text)

    if is_even(text_length):
        midpoint = int(text_length / 2)
        return text[(midpoint - 1):(midpoint + 1)]
    else:
        return text[text_length // 2]



print(center_of('I Love Python!!!') == "Py")    # True
print(center_of('Launch School') == " ")        # True
print(center_of('Launchschool') == "hs")        # True
print(center_of('Launch') == "un")              # True
print(center_of('Launch School is #1') == "h")  # True
print(center_of('x') == "x")                    # True