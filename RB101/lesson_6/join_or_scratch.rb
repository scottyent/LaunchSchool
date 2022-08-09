# Input: An array of numbers
# Output: A string, joined with a specified delineator,
# and the words "or" or "and" to tack on the last number

# Rules:
# It has to have a default dilineator (", ")
# It also has to be able to take a new dilineator
# Default end piece is "or", but has to be able to accept "and"

# Algo
# Perhaps, pop to delete the trailing element and return it
# Use Join to add the rest together with the appropriate thing
# then append the last word or/and and lastly, the final element
# Size though. size of 1 should just return number :DONE
# size of 2 should skip to the including the or/and
# rest would function as normal
require 'pry'
require 'pry-byebug'


def joinor(choices_array, delineator = ", ", end_word = "or")
  case choices_array.size
  when 1
    return choices_array[0].to_s
  when 2
    return "#{choices_array[0]} #{end_word} #{choices_array[1]}"
  else
    full_choices = ''
    trailing_element = choices_array.pop
    full_choices << choices_array.join(delineator)
    full_choices << "#{delineator}#{end_word} #{trailing_element}"
    return full_choices
  end
end


# Test Cases
p joinor([5]) == "5"
p joinor([1, 2]) == "1 or 2"
p joinor([1, 2, 3]) == "1, 2, or 3"
p joinor([1, 2, 3], '; ') == "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"