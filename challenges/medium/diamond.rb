# The diamond exercise takes as its input a letter, and outputs it in a diamond
# shape. Given a letter, it prints a diamond starting with 'A', with the
# supplied letter at the widest point.

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.

# Input: A letter
# Output: a diamond counting from A to that letter and back down again

# Rules
# Explicit:
# * They're mostly listed above
# Implicit:
# * it's a Diamond class with a class method `make_diamond` - accepts one letter
# * these are all uppercase letters

# Algorithm:
# * Each width will be equal to the height, and will have to insert the
# appropriate letters within that.
# * I think perhaps creating a range of A-Z and converting to an array
# can be a useful way to actually traverse the alphabet. That way it's technically
# capable of doing the entire alphabet AND we can use an index number as a markeer
# for where we're starting, stopping, and reversing.
# * the question is, what's th algo for the lines.
# * First and last line: width of the diamond (which is index of the letter * 2, -1, + 2 ofr the letters)
# minus 1 (for A), then that number * space + a + that number * space
# * middle row: width of the diamond minus 2, given number + space* that number + given number
# * Inbetween numbers...  side padding minus 1 from the top, until reverse. inner padding +2 until reverse

# * what is the controller of the loop, what loop. So I can do build middle lines
# decrement padding let it build its thing, increment inner padding at the end
# where it is padding + index + inner padding + index + padding new line
# increment index at the end


# example
#   A
#  B B
# C   C
#  B B
#   A

#   so first and last line is just one thing, it's A in the middle of the total width
#   that's easy.

#   middle line is also easy, it's the middle letter (letter given) with width - 2 spaces in between

#     A
#    B B
#   C   C
#  D     D
# E       E
#  D     D
#   C   C
#    B B
#     A

class Diamond
  LETTERS = ("A".."Z").to_a

  def self.make_diamond(letter)
    return "A\n" if letter == 'A'

    result = ""

    width = find_width(letter)
    padding = width / 2
    inner_padding = 1
    index = 0
    given_letter_index =  LETTERS.index(letter)
    reverse = false

    start_end = "#{' ' * padding }#{LETTERS[index]}#{' ' * padding }\n"
    result << start_end

    (width - 2).times do |_|
      reverse ? index -= 1 : index += 1
      current_letter = LETTERS[index]
      reverse ? padding += 1 : padding -= 1
      result << "#{' ' * padding}#{current_letter}#{' ' * inner_padding}#{current_letter}#{' ' * padding }\n"
      reverse = true if index == given_letter_index
      reverse ? inner_padding -= 2 : inner_padding += 2
    end

    result << start_end
  end

  def self.find_width(letter)
    LETTERS.index(letter) * 2 + 1
  end
end
