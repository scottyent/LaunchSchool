# Input: a string of one word or multiple words
# Output: a full sentence telling you how many characters there are, with the original string displayed

# Rules
# White space doesn't count as a character

puts "Please enter a word or multiple words"
word_input = gets.chomp
size = word_input.split.join.size

puts "There are #{size} characters in \"#{word_input}\""