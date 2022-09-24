# Input: Array of words
# Output: print out arrays grouped by words with the same letters

# Algo
# Get to a place where you have a hash with the word and the anagram list in one array
# step 1 - go from one word, to a single array of all the words as strings. DONE
# Iterate through each word, create a temp array with all permutations of the word
# inner loop iterating through all the words again, and if they're in the permutations array
# Add them to another temporary array specific to that word.
# End of the word iterations, add that array to a master array and go to the next one

# at the end, iterate through the hash, and print out the results for each one

require 'pry'
require 'pry-byebug'

def group_anagrams(words)
  anagram_groups = []

  words.each do |word|
    next if anagram_groups.flatten.include?(word)

    word_permutations = []
    matched_words = []

    word.chars.permutation { |combo| word_permutations << combo.join }
    words.each { |word| matched_words << word if word_permutations.include?(word) }
    anagram_groups << matched_words
  end

  anagram_groups.each { |group| p group }
end


  # permutations = words.each_with_object([]) do |word, array|
  #   word.chars.permutation { |combo| array << combo }
  # end

  # p permutations



# Test Cases
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

group_anagrams(words)

  # Output
# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)
