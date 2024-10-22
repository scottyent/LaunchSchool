# Write a function that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character.

def crunch(doubled_text):
    if not doubled_text:
        return doubled_text

    crunched_text = doubled_text[0]

    for char in list(doubled_text):
        if char == crunched_text[-1]:
            continue

        crunched_text += char

    return crunched_text


# These examples should all print True
print(crunch('ddaaiillyy ddoouubbllee') == 'daily double')
print(crunch('4444abcabccba') == '4abcabcba')
print(crunch('ggggggggggggggg') == 'g')
print(crunch('abc') == 'abc')
print(crunch('a') == 'a')
print(crunch('') == '')