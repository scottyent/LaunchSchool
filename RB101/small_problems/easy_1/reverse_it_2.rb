# Input: A string with one or more words
# Output: A new string that reverses the words that are longer than 5 characters
# Rules
# - Only reverse words that are 5 or more characters
# - There should only be a space when more than word is present
# - capitalization stays the same

# Algo
# - Break the string into an an array format
# - Iterate over the array and check word lengths, setting that index to a reversed version if it's 5 char or more
# - Convert the array back into a string and return the result

# Implementation 1
# def reverse_words(string)
#   word_array = string.split
#   if word_array.size == 1
#     if word_array[0].size >= 5
#       word_array[0] = word_array[0].reverse
#       result = word_array.join()
#     end
#   else
#     word_array.each_index do |index|
#       if word_array[index].size >= 5
#         word_array[index] = word_array[index].reverse
#       end
#     result = word_array.join(" ")
#     end
#   end
#   result
# end

# Refactoring
def reverse_words(string)
  word_array = string.split
  word_array.each_index do |index|
    if word_array[index].size >= 5
      word_array[index] = word_array[index].reverse
    end
  end
  word_array.join(" ")
end

# I realized that join with a space parameter doesn't actually add a space to a singular word anyway, so I didn't have to test for that
# I could just split to array, reverse appropriate words, and apply join(" ") to it and regardless of it being 1 or 20 words, it'll be correct

# Official Solution
# def reverse_words(string)
#   words = []

#   string.split.each do |word|
#     word.reverse! if word.size >= 5
#     words << word
#   end

#   words.join(' ')
# end

# Test Cases
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS