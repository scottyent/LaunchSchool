=begin
Input: 3 integers representing sides of a triangle
Output: a symbol that says which type of triangle it is (or invalid):

equilateral -  All 3 sides are of equal length
isosceles -  2 sides are of equal length, while the 3rd is different
scalene - All 3 sides are of different length


Rules
To be a valid triangle, the sum of the lengths of the two shortest sides
must be greater than the length of the longest side, and all sides must
have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Steps:
I think we should put these numbers in an array
initialize triangle array, put all sides in it

first check should be, do any sides equal or are less than zero, :DONE
  with an array, this is easy using any?
  if passes that test, then sort the array, and sum the first two elements (the shortest)
    and see if they're greater than the third. return :invalid if not :DONE

Ok now we know it's a valid triangle.

Check for equality first. Thought this would be easier with a method like all?
but I don't think with the block it's terribly easy to compare all.
Since it's a triangle, I don't see a problem with comparing via index

scalene is easy too, opposite of quality. so check for those ttwo.
=end

require 'pry'
require 'pry-byebug'

def triangle(side1, side2, side3)
  triangle = [side1, side2, side3].sort
  if triangle.any? { |side| side <= 0 } || triangle[0] + triangle[1] < triangle[2]
    return :invalid
  end

  if triangle[0] == triangle[1] && triangle[1] == triangle[2]
    :equilateral
  elsif triangle[0] != triangle[1] && triangle[1] != triangle[2]
    :scalene
  elsif triangle.any? { |side| triangle.count(side) == 2 }
    :isosceles
  end
end

# Test Cases
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
p triangle(4, 2, 2) == :isosceles