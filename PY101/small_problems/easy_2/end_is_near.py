# Write a function that returns the next to last word in the string argument.

# Words are any sequence of non-blank characters.

# You may assume that the input string will always contain at least two words.

# def penultimate(words):
#     return words.split()[-2]

# # These examples should print True
# print(penultimate("last word") == "last")
# print(penultimate("Launch School is great!") == "is")

# Further Exploration
# Our solution ignored two edge cases since we explicitly stated that you didn't have to handle them: strings that contain no words or just one word.

# Suppose we need a function that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a function that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

# Edge cases:
# Middle of an even amount of words, what do do then?
# Empty string
# I think it's safe to say it'll be separated by whitespace, but I suppose
# there could be other things involved like brackets or parenthesis.
# Do I care about that? Is that an edge case?

def is_even_list(item):
    return len(item) % 2 == 0

def middle_word(words):
    '''Take a sentence/phrase and return the middle word. Returns None if
    the string is empty, and returns the middle two words if the amount of
    words is even.'''

    if not words:
        return None

    words_list = words.split()
    middle = (len(words_list) // 2)

    if not is_even_list(words_list):
        return words_list[middle]
    else:
        return ' '.join(words_list[middle -1: middle + 1])

# "This is an example sentence." -> an
# "And another one." -> another
# "How about this one? (I'm not sure)" -> one
# "Lastly, an even one" ->

print(middle_word("This is an example sentence.") == 'an')
print(middle_word("And another one.") == 'another')
print(middle_word("How about this one? (I'm not sure)") == 'one?')
print(middle_word("Lastly, an even one") == 'an even')
print(middle_word('') == None) # -> None

# Punctuation is a tricky thing here, but in the definition of what a word is:
# "Words are any sequence of non-blank characters.""
# We can safely assume that we can leave the characters in and consider them
# part of the "word"