# A method that returns the sum of two integers

# Informal pseudo-code
=begin
- Ask user for first number and save it to a variable
- Ask user for second number and save it to variable
- Check types (integer vs string for example) and act accordingly
- Add the two numbers together
- Return the result
=end

#Formal
=begin
START

PRINT What's the first number to add?
SET number1 equal to the results of GET the first number from user

PRINT What's the second numebr to add?
SET number2 equal to the results of GET the second number from user

SET result equal to number1 + number2, but check to make sure they're the right ypes

READ/Return result

END
=end

# In Ruby:
=begin ------------------------------
#edited out for further examples
def add_two_numbers()
  puts "What's the first number to add?"
  number1 = gets.chomp.to_i

  puts "What's the second number to add?"
  number2 = gets.chomp.to_i

  result = number1 + number2
end

puts add_two_numbers()
-------------------------------- =end

#  method that takes an array of strings, and returns a string that is all those strings concatenated together

# Informal pseudo-code
=begin
Given a collection of strings
Create result string that's equal to an empty string
Iterate through the strings, and one by one add them to the result variable
return the result
=end

# Formal pseudo-code
=begin
START

Accept an array of strings in the method

SET iterator = 1
SET result equal to an empty string

WHILE iterator <= length of string array
SET result += string array[iterator]
iterator += 1

return result

END
=end

# In ruby
=begin ------------------------------
def string_adder(str_array)
  result = ""

  str_array.each do |string|
    result += string
  end

  result
end

p string_adder(["This", "Is", "A", "Test"])
-------------------------------- =end

# a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. For instance:
# everyOther([1,4,7,2,5]) # => [1,7,5]

# Informal pseudo-code
=begin
Given a group of integers
Set index iterator at 0
interate over the array
only add the even indexes (iterators) to the new array
=end

# Formal pseudo-code
=begin

START

given a collection of integers called numbers

SET iterator = 1
SET empty array

WHILE iterator <= length of numbers
READ index for number
IF index is even
  send it to the new list
ELSE
  just skip over it

PRINT/RETURN new list
END
=end 

# In Ruby

=begin ------------------------------
def every_other(numbers)
  iterator = 0
  new_array = Array.new

  while iterator <= numbers.length
    if iterator.even?
      new_array << numbers[iterator]
    end
    iterator += 1
  end

  new_array
end

p every_other([1,4,7,2,5])
--------------------------------
=end

# a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

# Informal
=begin
Given a string, and search target
Initialize a found character counter
iterate through all characters in the string
When you find a match, increment counter
when counter is three, return the index of that character
=end

# Formal
=begin
START

SET counter equal to 0
SET Index_needed to nil
SET iterator equal to 0

while iterator <= length of the string
  test each character
  IF appropriate character
    counter +1
    if counter = 3
      index_needed = character index
  increment iterator

IF counter < 3 
return nil
    else
      return index_needed
=end 

# a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes. For instance:

# informal 
=begin
given 2 arrays of numbers
set an index number
create an empty array
create a loop length of both arrays combined
if the index is even, pull the first number off the array and add it to new array
otherwise, pull first number from second array and add to new array
return new array
=end

