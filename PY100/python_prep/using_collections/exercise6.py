# print('abc-def'.isalpha())

print('abc_def'.isalpha()) # false because _ is not an alphabetic char
print('abc def'.isalpha()) # false because ' ' is not an alphabetic char
print('abc def'.isalpha() and
      'abc def'.isspace()) # False because the first part of the and will fail (well, they both fail but it'll short circuit)
print('abc def'.isalpha() or
      'abc def'.isspace()) # False, though it will check both
print('abcdef'.isalpha()) # true
print('31415'.isdigit()) # true
print('-31415'.isdigit()) # I'm not sure how it handles negative numbers.
# I'd say True, because it says in the docs it can handle special handling and negative isn't even all that special
# well, I was wrong about that! It's False
print('31_415'.isdigit()) # False, _ is not a digit
print('3.1415'.isdigit()) # True, can handle decimal. NOPE! It's False. I don't know
# why I got it in my head floats are covered, but they are not. its literally
# searching for digits only, and '.' is not a digit.
print(''.isspace()) # false, because it has to have at least one item and there's not even a space in there.