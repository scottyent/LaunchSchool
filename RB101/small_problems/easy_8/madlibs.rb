# Ask for a noun, a verb, an adjective and an adverb and inject them
# into a story madlibs style

require 'pry'
require 'pry-byebug'

def prompt(string)
  puts "=> #{string}"
end

def get_valid_string()
  response = ''
  loop do
    response = gets.chomp
    break unless response.empty?
    puts "You didn't input anything!"
  end

  response
end

puts "Welcome to the madlibs generator!\n\n"

prompt "Please enter a noun:"
noun = get_valid_string()

prompt "Please enter a verb:"
verb = get_valid_string()

prompt "Please enter an adjective:"
adjective = get_valid_string()

prompt "Please enter an adverb:"
adverb = get_valid_string()

story = <<-STR
On a dark and scary night, you're suddenly startled by a #{noun} jumping
out in front of your path! You scream and begin to #{verb} #{adverb} to get
away from the #{adjective} thing. You fail miserably and are struck down!
STR

puts story