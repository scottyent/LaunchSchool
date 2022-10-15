=begin
Input: String
Output: boolean true/false

Rules
The goal is to check whether parentheses are properly balanced
Meaning that they are matching pairs
So the challenge here is that it isn't a simple count
It's tracking whether they match appropriately
E.g. 'What ((is))) up(' has three opening, and three closing
but they're not valid.

Steps:
Iterate through the charactes
keep track of open parenth and close parantheses
close should never get above the opens
and only test the ones where they start of matching

return false if the amount of open and close parenth aren't equal
set variable string_array to .chars
initialize open_parenth and close_parenth to zero

iterate through the array
if the character is an open or close parenth, increment that variable
return false if closed is greater than open

otherwise return true
=end

# def balanced?(string)
#   return false if string.count('(') != string.count(')')
#   string_array = string.chars
#   open_parenth = 0
#   close_parenth = 0

#   string_array.each do |char|
#     open_parenth += 1 if char == "("
#     close_parenth += 1 if char == ")"
#     return false if close_parenth > open_parenth
#   end

#   true
# end

# Refactor using the solution given, to now include
# square and curly brackets:
require 'pry'
require 'pry-byebug'

def balanced?(string)
  balanced_punct = {
    parens: 0,
    square: 0,
    curly: 0
  }

  string.each_char do |char|
    balanced_punct[:parens] += 1 if char == '('
    balanced_punct[:parens] -= 1 if char == ')'
    balanced_punct[:square] += 1 if char == '['
    balanced_punct[:square] -= 1 if char == ']'
    balanced_punct[:curly] += 1 if char == '{'
    balanced_punct[:curly] -= 1 if char == '}'

    balanced_punct.values.each { |count| break if count < 0 }
  end

  balanced_punct.values.all?(0)
end
# Test Cases
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

# # square brackets
p balanced?('What [is] this?') == true
p balanced?('What is] this?') == false
p balanced?('What [is this?') == false
p balanced?('[What] [is this]?') == true
p balanced?('[[What]] [is this]]?') == false
p balanced?('Hey!') == true
p balanced?(']Hey![') == false
p balanced?('What [[is]]] up[') == false

# curly brackets
p balanced?('What {is} this?') == true
p balanced?('What is} this?') == false
p balanced?('What {is this?') == false
p balanced?('{What} {is this}?') == true
p balanced?('{{What}}} {is this}}?') == false
p balanced?('Hey!') == true
p balanced?('}Hey!{') == false
p balanced?('What {{is}}} up{') == false