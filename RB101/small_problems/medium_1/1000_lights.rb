# Input: An integer representing the number of switches
# Output: an array representing which switches are on

# Rules
# You pass through the switches the exact same amont of times as switches exist

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# Round 1: on, on, on, on, on
# Round 2: on, off, on, off, on - so we turned OFF the even lights, that's clear (toggled even, 2, 4)
# Round 3: on, off, off, off, on - so we turned off 3... the middle light (toggled, 3)
# Round 4: on, off, off, on, on - only turned on 4 (toggled 4)
# Round 5: on, off, off, on, off - toggled 5

# AHHHH - multiples. Multiples of 2, multiples of 3, multiples of 4 and so on which can also be a counter number

# Algo
# Loop should loop the same amount of times as the amount of switches. so 1.upto(switch_amount) is a good mechanism.
# I think I should use a true false boolean to track whether the switch is "on" or "off" - it'd be easiest.
# Data strucutre - I could do this with a simple array of trues, and change things based on the loop number - 1 to get the index.
# or I could do it with a hash, where each switch has a value - just feels wasteful because it'll be like, 1,2,3,4,5, which is great for an array. And in order.
# Alright, array it is.

# Initialize a switches array, with n amount of switches all set to false :DONE
# Initialize a lights on array to an empty array :DONE
# create a number based loop. Perhaps times to use that as index, perhaps upto to use that as divisble check :DONE
# each quantity loop, iterate through the array and if the switch number is % by the divisble check or index + 1, set the value to ![currentvalue]. :DONE
# At the end, you'll have an array of trues/falses. Iterate with index, and if the value equals true, add that index number + 1 to the lights_on array

require 'pry'
require 'pry-byebug'

def switch_checker(num_switches)
  switches = []
  num_switches.times { |_| switches << false }

  lights_on = []

  # Runs through and toggles all approrpiate switches n amount of times
  1.upto(num_switches) do |pass_number|
    switches.each_with_index do |switch, index|
      switches[index] = !switches[index] if (index + 1) % pass_number == 0
    end
  end

  # Adds on switches to the final result array
  switches.each_with_index do |switch, index|
    switch_number = index + 1
    lights_on << switch_number if switch
  end

  lights_on
end

# Test Cases
p switch_checker(5) == [1, 4]
p switch_checker(10) == [1, 4, 9]
p switch_checker(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]