=begin
Input: three integers representing the angles
Output: a symbol representing whether the triangle is acute, obtuse, or right

right =  One angle of the triangle is a right angle (90 degrees)
acute = All 3 angles of the triangle are less than 90 degrees
obtuse = One angle is greater than 90 degrees.

Rules
Validity
To be a valid triangle, the sum of the angles must be exactly 180 degrees,
and all angles must be greater than 0: if either of these conditions is
not satisfied, the triangle is invalid.

You can assume it will always be integer values.

Steps:
* Add all the angles to angles array
* Check validity of the triangle
  * use .sum to make sure it's equal to 180
  * use all? to check that all angles are gretater than 0
  * return :invalid if these aren't true
* use a case statement with no variable
  * when .one?(90) -> :right
  * when .all? are less than 90
  * when .one? greater than 90


=end

def triangle(side1, side2, side3)
  angles = [side1, side2, side3]

  case
  when angles.sum != 180, angles.any? { |angle| angle <= 0 }
    :invalid
  when angles.one?(90)                    then :right
  when angles.all? { |angle| angle < 90 } then :acute
  when angles.one? { |angle| angle > 90 } then :obtuse
  end
end

# Test Cases
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid