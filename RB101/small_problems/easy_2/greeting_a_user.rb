# Input: asking for a name that would either be a normal name, or with an exlcamation point
# Output: A greeting including the name or all caps if it has an exclamation point.

puts "What is your name?"
name = gets.chomp

greeting = "Hello #{name}"

if name.end_with?("!")
  name = name.chop.upcase
  greeting =  "HELLO #{name}. WHY ARE WE SCREAMING?"
end

puts greeting

# Very similar to their implementation