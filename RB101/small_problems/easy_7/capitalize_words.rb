# Input: A singular string
# Output: A new string with all words capitalized and all letters lowercased

# Rules:
# Doesn't say you can't use capitalize :D
# It should be a new string, not a mutated string
# All letters should be lowercased if they don't start the word

require 'pry'
require 'pry-byebug'

# My attempt
# def word_cap(string)
#   string_array = string.split

#   string_array.each { |word| word.capitalize! }

#   string_array.join(' ')
# end

# # Their succinct solution:
# def word_cap(words)
#   words.split.map(&:capitalize).join(' ')
# end

# Without using capitalize 1:
# def word_cap(words)
#   words_array = words.downcase.split

#   words_array.each { |word| word[0] = word[0].swapcase }.join(' ')
# end

# Without using capitalize 2:
def word_cap(words)
  words_array = words.downcase.split

  words_array.each do |word|
    if ("a".."z").include?(word[0])
      ascii_letter = word[0].ord
      word[0] = (ascii_letter - 32).chr
    end
  end

  words_array.join(' ')
end

# Test Cases
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
