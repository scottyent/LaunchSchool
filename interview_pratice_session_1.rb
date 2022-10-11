# Input: an array of strings all in lowercase
# Output: a new array, listing every character that shows up in all strings, including duplicates
# Intersection of arrays would have done it, but it doesn't include duplicates

# Rules
# all lowercase
# include duplicates
# New array return
# I guess order matters, so we should do it as we're iterating right

# Algo
# Initialize results array :DONE
# You only have to iterate over the characters of the first word right, because if a letter
# Exists in the others, it would be in that word too.
# So you iterate through the first word, take the letter, and get its count
# Then you iterate over the other words, and break if .include? returns false.
# on each word you check, also get the count, and save it to count if it's less than the current count
# lastly for the larger loop, add that letter * the min count into a new results array

require 'pry'
require 'pry-byebug'

def common_chars(words_array)
  results = []
  first_word_array = words_array.shift.chars

  first_word_array.each do |letter|
    next if results.include?(letter)
    matched_all = true

    matched_all = false unless words_array.all? { |word| word.include?(letter) }

    if matched_all
      lowest_count = first_word_array.join.count(letter)

      words_array.each do |word|
        current_count = word.count(letter)
        if current_count < lowest_count
          lowest_count = current_count
        end
      end

      lowest_count.times { |_| results << letter}
    end
  end

  results
end

# Test Cases
p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(%w(cool lock cook)) == ["c", "o"]
p common_chars(%w(hello goodbye booya random)) == ["o"]
p common_chars(%w(aabbaaa ccdddddd eeffee ggrrrrr yyyzzz)) == []