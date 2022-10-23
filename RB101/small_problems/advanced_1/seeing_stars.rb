# Write a method that displays an 8-pointed star in an nxn grid,
# where n is an odd integer that is supplied as an argument to the method.
# The smallest such star you need to handle is a 7x7 grid.

=begin
Input: an integer representing the width and height of the grid
Output: an eight side star

Rules
You'll always be given an odd number larger than 6
Each line (Except for the middle) is 3 stars
middle line is equal to the integer given

Steps:

for now I'll focus on the top side
  ok so for 7

it's 7 spots, with a star on each end, width - 3/2 spaces between stars
so I can maybe do left buffer right buffer, because that will grow proportionately to
  the spaces between stars sinking

so line one =
buffer(0) + star + spaces(2) + star + spaces(2) + star + buffer(0)
buffer(1) + star + spaces(1) + star + spaces(1) + star + buffer(1)
buffer(2) + star + spaces(0) + star + spaces(0) + star + buffer(2)

Ok, so I can do num/2 (integer division).times. make that counter the buffer
  make spaces = width - 3/2 - buffer

  then deal with center, and reversing it.

ok I can set a counter equal to zero
once it gets to half, print the center row
then start decrementing the counter. to decrease the buffer


=end

GAP = ' '
DRAWING = '*'

def star(num)
  max = num / 2
  buffer = 0
  reverse = false

  loop do
    spaces = GAP * ((num - 3) / 2 - buffer)
    buffer = GAP * buffer
    puts "#{buffer}#{DRAWING}#{spaces}#{DRAWING}#{spaces}#{DRAWING}#{buffer}"
    reverse ? buffer -= 1 : buffer += 1
    if buffer == max
      puts "#{DRAWING * num}"
      reverse = true
      buffer -= 1
    end
    break if buffer < 0
  end
end


# Test Cases
star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

puts("---------------------------------------------------------")
star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *