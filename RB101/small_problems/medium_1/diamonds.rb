# Input: an ODD integer (always)
# Output: a four pointed diamond drawn in asterisks

# Rules
# You can assume you'll always receive an odd integer as input
# the Diamond should be centered with the fat part in the middle, (one asterisk on top and bottom)
# If the input is one, it just prints one asterisk
# Each line is an odd number, and increases/decreases by 2 (1 -> 3 -> 5 -> 3 -> 1)
# The longest line in the diamond is equal to the input integer

# Algo
# Use the same area for up, then flip the switch to reverse, and use a ternary to decrement back down :DONE
# use a while loop to say continue until the line is either < the input, or > 0. This is just a catch all just in case :DONE
# intitiate multiplier as 1 to use inside the loop :DONE
# set an if condition, to set reverse equal to true when mutiplier == input :DONE
# the ternary should say reverse ? decrement multiplier : increment multiplier :DONE

# Ok, I've implemented above so I have the right amount of asterisks in each row
# And an up and down flow
# But it's left aligned and now I have to figure out how to center/where to inert asterisks

# Ok lets look at this example with 5
# If I know where to isert, I can first slice! the string with the length of the row I need to insert
# then insert the row with the appropriate amount of asterisks. for
#   |  *  | - insert index 2
#   | *** | - insert index 1
#   |*****| - insert index 0
#   | *** | - insert index 1
  # |  *  | - insert index 2

# with 9

#    *       - insert index 4
#   ***      - insert index 3
#  *****     - insert index 2
# *******    - insert index 1
#*********   - insert index 0
# *******    - insert index 1
#  *****     - insert index 2
#   ***      - insert index 3
#    *       - insert index 4

# Ok so first index is width.size/2, then decrement that until reverse where you increment it

# Algo for diamond shape
# Ternary along with the reverse one, that's reverse ? index += 1 : index -= 1
# If I set row equal to space * width to start each loop, then that would refresh it each time
# which will allow for adding or subtracting stars

# outside of loop, set index = width/2
# Inside loop, set row equal to empty space * width
# then create a row of asterisk * multiplier
# then slice!(index, asterisk_row.size)
# then insert(index, asterisk_row)

# My solution

# def diamond(width)
#   multiplier = 1
#   index = width / 2
#   reverse = false

#   while multiplier > 0 && multiplier < (width + 1) do
#     row = ' ' * width
#     reverse = true if multiplier == width
#     asterisks = "*" * multiplier

#     row.slice!(index, asterisks.size)
#     row.insert(index, asterisks)

#     puts row

#     reverse ? multiplier -= 2 : multiplier += 2
#     reverse ? index += 1 : index -= 1
#   end
# end

# The further exploration part, rewritten also with .center method that some solutions had
def hollow_out_row(row)
  return row if row.size == 1
  "*" + (' ' * (row.size - 2)) + "*"
end

def diamond(width)
  multiplier = 1
  reverse = false

  while multiplier > 0 && multiplier < (width + 1) do
    reverse = true if multiplier == width
    asterisks = "*" * multiplier
    asterisks = hollow_out_row(asterisks)

    puts asterisks.center(width)

    reverse ? multiplier -= 2 : multiplier += 2
  end
end

# Test cases

diamond(1)
diamond(5)
diamond(3)
diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *