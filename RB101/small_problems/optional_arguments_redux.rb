require 'date'

puts Date.civil
# My answer: print a date object with -47120-01-01 as the year, month, day
puts Date.civil(2016)
# My answer: <2016-01-01>
puts Date.civil(2016, 5)
# My answer: <2016-05-01>
puts Date.civil(2016, 5, 13)
# My answer: <2016-05-13>

# Results - all correct!
# -4712-01-01
# 2016-01-01
# 2016-05-01
# 2016-05-13