# (1..99).each { |num| p num if num.even? }

value = 1
while value <= 99
  if value % 2 == 0
    p value
  end
  value += 1
end

