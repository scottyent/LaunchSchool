# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# Greetings prints the hash, which includes hi there as the value for a: - reason is that
# when we assign informal_greeting to greeting[:a], we are pointing the variable to the same object that's in the hash
# Then, we call a mutating method (<<) on the original object in memory, which mutates the original value to "hi there"