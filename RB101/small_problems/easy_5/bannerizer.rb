# Input: String
# Output: That string within a box

# Rules
# The box has 3 pipe characters on each side
# The text is printed in the middle of the middle line
# the line above and line below have to match the size so the ends match
# The hyphens in the top message must reflect that

# Test Cases

def print_in_box(message)
  lengths = message.size

  if lengths > 76
    wrap_around = message[76, lengths]
    message = message[0, 76] + " |\n| " + wrap_around + "#{" " * (80 - (wrap_around.size + 4)) }"
    lengths = 76
  end

  horizontal_stop = "+-#{"-" * lengths}-+"
  empty_line = "| #{" " * lengths} |"

  puts horizontal_stop
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_stop
end

print_in_box('')
print_in_box("Hey like, look over here! It's a box with like a bunch of stuff in it etc this is a test")
print_in_box("Come on down to words in a box! Do you want, a box? With words? I kind of hacked that")
print_in_box("Well you're in luck! One day only, so many boxes, so many words")