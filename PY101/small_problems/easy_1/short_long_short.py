# Write a function that takes two strings as arguments, determines the length
# of the two strings, and then returns the result of concatenating the shorter
# string, the longer string, and the shorter string once again. You may assume
# that the strings are of different lengths.

def short_long_short(text1, text2):
    if len(text2) < len(text1):
        short = text2
        long = text1
    elif len(text1) < len(text2):
        short = text1
        long = text2
    else:
        print('These strings are the same length. Try again.')
        return None

    return f'{short}{long}{short}'

# These examples should all print True
print(short_long_short('abc', 'defgh') == "abcdefghabc")
print(short_long_short('abcde', 'fgh') == "fghabcdefgh")
print(short_long_short('', 'xyz') == "xyz")
print(short_long_short('xyz', 'xyz'))