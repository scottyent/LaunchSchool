# Input: Ask user for integer larger than 0, then ask sum or product of all the numbers between 1 and that integer
# Output: A sentence with the sum or the product between 1 and the number provided

# Algo
# set a variable called number, include to input converted to integer
# Set a variable called operator, equal to input from asking a question explicitly (e.g. s for sum, p for product), downcase it just to be sure
# Create a loop for doing this, but replace the += or *= with the appropriate operator as it goes up (can't do this dynamically because + and * aren't somethign you can assign)
# I think creating two helper functions will be cleaner, and help separate the logic if I just have to type += or *= anyway

def sum(num)
  (1..num).inject(:+)
end

def product(num)
  (1..num).inject(:*)
end

user_num = 0
loop do
  puts "Please enter an integer larger than 0."
  user_num = gets.chomp.to_i

  # Since the to_i returns 0 if not an integer, and we specified higher than 0 anyway
  break if user_num > 0
  puts "That's not a number larger than 0."
end

operator = ''
loop do
  puts "Enter 's' to compute the sum, 'p' to compute the product. (From 1 to #{user_num}"
  operator = gets.chomp.downcase

  break if %w(s p).include?(operator)
  puts "That's not a valid choice."
end

if operator == "s"
  result = sum(user_num)
  operator = "sum"
elsif operator == "p"
  result = product(user_num)
  operator = "product"
else
  puts "You didn't pick 'p' or 's'"
end

puts "The #{operator} of the integers between 1 and #{user_num} is #{result}"
