# Input: A string that is either empty, or filled with characters
# Output: The words themselves are reversed, or if it's just spaces, an empty string
# Rules:
# - The characters have to retain their capital (e.g. "R -> R")
# - An empty string, or a string of whitespace result in an empty string

# Algo
# - Check the string to see if there are actual characters or if the string is empty
# - If the string is not empty, check to see if it's all whitespace
# - If it is, return an empty string
# - If not, break up the words into a structure so they're individual words
# - Reverse the new structure, and recombine them to be a string with the words now in opposite order

# Implementation 1
# def reverse_sentence(sentence_string)
#   if sentence_string.size == 0 || sentence_string.strip == ""
#     return ""
#   end

#   word_array = sentence_string.split
#   word_array.reverse!
#   word_array.join(" ")
# end

# The much more elegant solution
def reverse_sentence(string)
  string.split.reverse.join(" ")
end

# The key here is that split gets rid of whitespace, and then join would convert it back to an empty string, so it works for those required edge cases

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''