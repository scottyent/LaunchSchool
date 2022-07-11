# Input: 2 integers representing the length and width of a room in meters
# Output: a sentence that says how much the room is in square meters, as well as square feet

# Rules
# Don't have to validate the inputs
# Outputs for square meters/feet are in floats

# Algo
# Ask the length in meters
# Store that into width variable
# Ask the width in meters
# store that in width variable
# convert both to feet under new variables (width_feet, length_feet)
# Either use a variable to create square feet, square meters, or just use string interpolation
# print a sentence and include the variables, rounded to two decimal places for square feet

SQMETERS_TO_SQFEET = 10.7639

puts "Enter the length of the room in meters:"
length_meters = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width_meters = gets.chomp.to_f

square_meters = (length_meters * width_meters).round(2)

square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{square_meters} square meters (#{square_feet} square feet)."