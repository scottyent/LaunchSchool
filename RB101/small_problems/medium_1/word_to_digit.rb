# Input: a string of words
# Output: the SAME string with all written out words converted to digits

# Rules
# The string itself can have any format (including the number word can end with punctutaion.)
# All word version seem to be lowercase (a question I would ask)

# Algo
# I think the easiest thing to do, would be to create a hash, that you iterate through
# with the string value as key, and digit value as value
# Iterate through the hash, then gsub! for the key as the search, and value as the replacement
# then return the mutated string

# First solution worked - trying further exploration to make it delete spaces between new digit characters

# Algo dafur.


require 'pry'
require 'pry-byebug'

def valid_integer?(num)
  num == num.to_i.to_s
end

def word_to_digit(sentence)
  string_to_digit = {
    'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
    'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
  }

  string_to_digit.each do |word, digit|
    sentence.gsub!(/\b#{word}\b/, digit)
  end

  array_chars = sentence.chars

  array_chars.each_with_index do |letter, index|
    if index > 0 && index < (array_chars.length - 2)
      left = array_chars[index - 1]
      right = array_chars[index + 1]

      if valid_integer?(left) && valid_integer?(right)
        array_chars.delete_at(index)
      end
    end
  end

  result = array_chars.join
  # binding.pry
  phone_number = result.scan(/\d{10}/)[0]
  formatted_phone_number = "(#{phone_number[0..2]}) #{phone_number[3..5]}-#{phone_number[6..9]}"
  if !phone_number.empty?
    result.gsub!("#{phone_number}", formatted_phone_number)
  end

  p result
end

# Test Cases
# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p word_to_digit('Please call me at five five five one two three four eight nine four. Thanks.') == 'Please call me at 5551234. Thanks.'