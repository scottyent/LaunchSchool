# Input: a string with minimum two words
# Output: a string of the second to last word

# Algo
# Split string
# return Index -2 value

def penultimate(string)
  string.split[-2]
end

# Test cases
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# Further Exploration - a method that returns the middle word of a phrase/sentence
# That handles all edge cases we can think of

# Input: string, with any amount of letters/words
# Output: the middle word string returned, or highlight saying nah there isn't one

# Rules
# I'll say that middle in this instance is middle of odd number, and idk
# Middle - display that there isn't a middle but here is the middle two words
# For empty strings, display a notice
# for one word, return the word


def middle_world(string)
  word_array = string.split

  if word_array.empty?
    puts "Your input was empty!"
    return ''
  end

  return word_array[0] if word_array.size == 1

  if word_array.size.odd?
    middle_index = word_array.size / 2
    return word_array[middle_index]
  else
    middle_index_start = (word_array.size / 2) - 1
    middle_section = word_array[middle_index_start, 2].join(" ")
    puts "There is no middle word since there is an even amount"
    puts "The middle two words are #{middle_section}"
    return middle_section
  end
end

# Test cases
p middle_world('') == ''
p middle_world('onething') == 'onething'
p middle_world('this is a phrase') == 'is a'
p middle_world('this is a better phrase') == 'a'

