# Problem 1
# Given the array below
# Turn this array into a hash where the names are the keys and the values are the positions in the array.

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# flintstones_hash = {}
# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index
# end
# p flintstones_hash

# My answer matched the proposed solution!

# Problem 2
# Add up all the ages from the munster family hash

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# total_age = 0
# ages.each { |_, age| total_age += age }
# p total_age

# an alternative, which is WAY more elgant: ages.values.sum

# My answer matched the proposed solution, except making it an underscore for the key arguement in the method since we don't use it


# Problem 3

#remove people with age 100 and greater.

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.delete_if { |name, age| age >= 100 }

# p ages

# Their solution chose to use .keep_if and reverse the condition, I like delete_if more. Another option is select! which would mutate the caller

# Problem 4

# Pick out the minimum age from our current Munster family hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# p ages.min
# lowest_age = ages.values.min

# p lowest_age

# Min used within the hash returns the minimum hash key/value pair, but using .values I converted it to an array to get the min down to a singular element
# The solution they used is also the ages.values.min

# Problem 5

# Find the index of the first name that starts with "Be"

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# p flintstones.find_index { |name| name.start_with?("Be")}

# The solution just used .index which appears to be the same thing as find_index, just shorter - which is always preferred!

# Practice Problem 6

# Amend this array so that the names are all shortened to just the first three characters:

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.map! { |name| name[0, 3] }

# p flintstones

# Solution was implemented exactly the same

# Practice Problem 7
# Create a hash that expresses the frequency with which each letter occurs in this string:

# statement = "The Flintstones Rock"
# statement_array = statement.split("")

# frequency = {}

# statement_array.uniq do |letter|
#   if letter == " "
#     next
#   end
#   frequency[letter] = statement.count(letter)
# end

# p frequency

# Alright, they went with a very different solution this time, creating an alphabet to iterate through and check.
# I like mine better from a logical standpoint, whereas theirs may be a bit more flexible (and doesn't have to account for whitespace)
# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a

# letters.each do |letter|
#   letter_frequency = statement.count(letter)
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# Practice Problem 8

# What happens when we modify an array while we are iterating over it? What would be output by this code?
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   p numbers
#   numbers.shift(1)
# end
# I would expect this to remove a leading element each iteration, so it'd print: (oh it is printing NUMBER not NUMBERS) whoops
# First time through, it'd print a 1
# Second time through... the array has been modified and shifted, so it's looking for the item at index 1, which is now the 3
# then it shortens the array again to a length that runs out on those indexes, so it stops

# How about this one?
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# First time: 1
# Second time: 2
# stop because the index doesn't make sense anymore with the shortened array

# Practice Problem 9
# write a titleize implementation, so each word starts with a capital
# words = "the flintstones rock"

# words_array = words.split
# words_array.each { |word| word[0] = word[0].upcase }
# words = words_array.join(" ")

# Their solution is quite a bit more elegant:
# words.split.map { |word| word.capitalize }.join(' ')

# Practice Problem 10
# Given the munsters hash below
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

#Modify the hash such that each member of the Munster family has an additional "age_group" key
# that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below
# a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

# Input: A nested hash containing names, and then information about them
# Output: a modified hash that now includes an age group key in the nested hash, with a category of kid, adult senior

# Algo
# Iterate through the hash, looking at nested hash with the key age
# Set up an if statement to split by the 3 different ranges
# Assign the new value of age_group depending on the if branch they're on

# munsters.each do |name, info|
#   age = munsters[name]["age"]
#   if (0..17).include?(age)
#     munsters[name]["age_group"] = "kid"
#   elsif (18..64).include?(age)
#     munsters[name]["age_group"] = "adult"
#   else
#     munsters[name]["age_group"] = "senior"
#   end
# end

# p munsters
# well that did it, let's see if there was an easier way :D
# They did it with a case statement which yeah, fair enough. I didn't think it was worth it for only 3 cases like this, but thought about using it.