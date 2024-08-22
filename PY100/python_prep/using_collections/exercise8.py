# Explain why the code below prints different values on lines 3 and 4.

text = "It's probably pining for the fjords!"

print(text[21:35].rfind('f'))     # 8
print(text.rfind('f', 21, 35))    # 29

# These are different because when you slice the text first, then rfind is
# returning the index of the searched element in that newly created slice.
# For line 4, using the slicing arguments in .rfind, it will be referencing the
# starting index from the whole original string.
