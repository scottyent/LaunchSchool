# Input: Integer
# Output: if positive, negative version of the number, negative or 0 returns itself

# Algo
# Is this... deceptively hard? Seems really easy
# Just, num > 0 and negate if it is, otherwise return itself

def negative(num)
  num.positive? ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby