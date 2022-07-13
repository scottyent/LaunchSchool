# Input: nothing
# Output: randomly generate a number between 20 and 200
# Rules:
# - Print the output in a sentence "Teddy is x years old!"

# Algo
# Create a random selection within the range
# Save it to a variable
# Print the variable in the required output sentence

# Implementation 1
# puts "Teddy is #{(20..200).to_a.sample} years old!"

# Further Exploration - ask for a name and print that name, but if no name entered use "Teddy"

puts "What's your name?"
name = gets.chomp
name = "Teddy" if name.empty?

puts "#{name} is #{(20..200).to_a.sample} years old!"