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


# Further Exploration
# Count the number of months that have 5 Fridays

# Steps
# It says to account for leap years is the challenge
# I guess I don't undersatnd, perhaps there are 52 fridays on every year that's not a leap
# But i'll just brute force it, and start a year instance, iterate through every day
# if it's friday, put the month (numberical) in a dictionary, and increment it

def five_fridays(year)
  current_date = Date.new(year, 1, 1)
  months_fridays = {}

  365.times do |_|
    if current_date.friday?
      month = current_date.month
      if months_fridays.key?(month)
        months_fridays[month] += 1
      else
        months_fridays[month] = 1
      end
    end
    current_date = current_date.next_day
  end

  months_fridays.select { |month, fridays| fridays  == 5 }.count
end

p five_fridays(2015)
p five_fridays(1986)
p five_fridays(2019)
