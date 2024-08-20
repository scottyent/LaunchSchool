# Is there a method to reverse a string, for example turning 'hello' into 'olleh'?

# I can't find one. I tried to find an easy way to conver to list, reverse,
# and convert back to a string but I was spending too much time trying
# to figure out how to get back to a string. So I'm just going to solve this
# in perhaps a not elegant way, and then I can check the solution.


def reverse_string(text):
    reverse_text = ''

    word_list = list(text)

    for letter in reversed(word_list):
        reverse_text += letter

    return reverse_text

print(reverse_string('hello'))
print(reverse_string('pennies'))

# Ah ok, there isn't one but they implemented a much more elegant solution:

word = 'test'
reverse_word = word[::-1]
print(reverse_word)