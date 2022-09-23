# Input: 3 integers that represent grades
# Output: the letter representation of the average of the grades

# Rules
# All test values are between 0 and 100

# Algo
# Sum up and average
# Case statement for the ranges, that return a string

def get_grade(*grades)
  average = grades.sum / grades.size.to_f
  case average
  when 90..100 then 'A'
  when 80..89 then 'B'
  when 70..79 then 'C'
  when 60..69 then 'D'
  else             'F'
  end
end

# Test Cases
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"