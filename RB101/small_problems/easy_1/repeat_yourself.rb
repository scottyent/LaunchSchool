# Implementation 1
# def repeat(string, times_repeated)
#   while times_repeated > 0
#     puts string
#     times_repeated -= 1
#   end
# end

# Implementation 2
def repeat(string, times_repeated)
  times_repeated.times { puts string }
end

# Practicing the PEDAC Process
# Input: a string, and a positive integer
# Outpot: prints the exact same string, the amount of times as the integer indicates

# Test Cases
repeat('Hello', 3) # -> "Hello\n Hello\n Hello\n"
repeat('That is correct', 5)

# Algo
# I have to take the string, use a form of a loop to repeatedly print it as many times as the integer indicates

