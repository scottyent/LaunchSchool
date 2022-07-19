# Input: get 6 numbers
# Output: Check if the first number is contained in the first 5 numbers

# Rules:
# Ask for each number individually
# Express the result in a sentence that includes the array

# Algo
# Loop to ask the question six times, and use the .times loop to insert which number you're entering :DONE
# Add each answer to the array, but converted to i :DONE
# Perhaps go back and add validation for the input (That it's a valid number) ... :DONE

def valid_integer?(string)
  string.to_i.to_s == string
end
# Loop to get input
number_array = []
puts "I will ask you for 6 integers, and then tell you if the 6th integer is included in the 1st five."

(1..6).each do |num|
  number = 0
  loop do
    puts "Enter number #{num}"
    number = gets.chomp
    break if valid_integer?(number)
    puts "I'm sorry that's not a valid integer, try again."
  end
  number_array << number.to_i
end

search_number = number_array[-1]
array_to_search = number_array[0, 5]
if array_to_search.include?(search_number)
  puts "The number #{search_number} appears in #{array_to_search}"
else
  puts "The number #{search_number} does not appear in #{array_to_search}"
end
