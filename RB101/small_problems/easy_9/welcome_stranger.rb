# Input: An array with a name separated and a hash with title and occupation
# Output: a greeting using the full name, their title and occupation

# Algo
# Pretty straight forward
# join the strings in the array to form a name string
# use string interpolation and print a greeting inserting name
# And the key values from the hash

def greetings(name, info)
  name = name.join(' ')
  title = info[:title]
  job = info[:occupation]
  puts "=> Hello, #{name}! Nice to have a #{title} #{job} around."
end

# Test case
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.