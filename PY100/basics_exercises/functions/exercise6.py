# Write a function that compares the length of two strings. It should
# return -1 if the first string is shorter, 1 if the second string is
# shorter, and 0 if they're of equal length. For example:

def compare_by_length(text1, text2):
    length1 = len(text1)
    length2 = len(text2)

    if length1 < length2:
        return -1
    elif length2 < length1:
        return 1
    else:
        return 0


print(compare_by_length('patience', 'perseverance')) # -1
print(compare_by_length('strength', 'dignity'))      #  1
print(compare_by_length('humor', 'grace'))           #  0