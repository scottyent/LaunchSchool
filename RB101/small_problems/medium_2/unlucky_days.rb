=begin
Input: a year
Output: the number of Friday the 13ths within that year.

Rules
None, apparently. Gregorian calendar is used.
Steps:
Ok after playing with the date class
Initiate the year into a date class, with the start of january, 13 :DONE
initialize friday_13s = 0

iterate 11 times
first check .friday?
if yes, add to results
then fast forward the year date instance one month

=end

require 'date'
require 'pry'

def friday_13th(year)
  current_date = Date.new(year, 1, 13)
  friday_13 = 0

  12.times do |_|
    friday_13 += 1 if current_date.friday?
    current_date = current_date.next_month
  end
  friday_13
end

# Test Cases
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2