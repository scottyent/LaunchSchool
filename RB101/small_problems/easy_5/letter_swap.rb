# Input: A string of words (separated by spaces)
# Output: A new string where the first and last letter are swapped

# Rules
# the new string has to have the same space delineated format

# Algo
# Split the input into an array
# Iterate through each word, and make the changes
# Use map to create a new array with fixed words
# Join the array into a sentence with spaces between
# return the result

def swap(normal_string)
  normal_array = normal_string.split

  fixed_array = normal_array.map do |word|
    first_letter = word[0]
    last_letter = word[-1]
    fixed_word = "#{last_letter}" + "#{word[1, word.size - 2]}" + "#{first_letter}"
    fixed_word = word if word.size == 1

    fixed_word
  end

  fixed_array.join(" ")
end

 # Test cases
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'