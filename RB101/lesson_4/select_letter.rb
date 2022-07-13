# Input: A string, and a letter that we want to search for
# Output: A new string that includes every occurence of the letter

# Algo
# create a method that takes a string and the search letter
# create a counter initialized to zero
# create an empty string called found_letters
# loop through the string using the counter as an index
# if the letter matches the search letter, add it to the found_letters array

def select_letter(sentence, character)
  found_letters = ''
  counter = 0

  loop do
    break if counter == sentence.size

    current_letter = sentence[counter]
    found_letters << current_letter if current_letter == character

    counter += 1
  end

  found_letters
end

question = 'How many times does a particular character appear in this sentence?'

p select_letter(question, 'a')
p select_letter(question, 't')
p select_letter(question, 'z')

p select_letter(question, 'a').size # => 8
p select_letter(question, 't').size # => 5
p select_letter(question, 'z').size # => 0