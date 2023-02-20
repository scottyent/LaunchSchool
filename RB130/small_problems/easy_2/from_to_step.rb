# Create a step method but without a range. It will take:
# - starting value
# - ending value
# - step value between

# It can also take a block that it will yield to for each iterative value

# Lastly, what return value would make sense?
# Hm. I can't come up with this one. Based on the patterns of step and upto,
# it would seem that convention is that it returns itself. Since this is a few
# inputs, self is usually the starting number so I could return start_num.
# I'm just not sure why it would be good. So instead, I'm going to say, an
# array of the result because I think if you are using step you are likely
# looking to do something with those numbers, and you can chain another method
# on right afterwards. (They went with the final number in the sequence which
# I would have to modfiy mine to break before the last increment)

def step(start_num, end_num, step)
  number = start_num
  resulting_array = []

  while number <= end_num
    resulting_array << number
    yield(number)
    number += step
  end

  resulting_array
end

# Test Example
p step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10