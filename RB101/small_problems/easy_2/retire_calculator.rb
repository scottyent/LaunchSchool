# Input: current, age, and target retirement age
# Output: Current year, target year retirement, and how many years you have to go!

# Rules
# You have to specify what year it is, and what the target year will be for retirement
# Then display the number of years to go
# Don't worry about floats/number validation

puts "What is your age?"
age = gets.to_i

puts "At what age would you like to retire?"
target_age = gets.to_i

current_year = Time.now.year
time_left = target_age - age
target_year = current_year + time_left

puts <<-MSG
It's #{current_year}. You will retire in #{target_year}.
You have only #{time_left} years of work to go!
MSG

# Wow, I almost verbatim wrote the solution they did :)