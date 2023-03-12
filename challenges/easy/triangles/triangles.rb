# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of length > 0,
# and the sum of the lengths of any two sides must be greater than the length
# of the third side.

=begin
Input: presumably, 3 integers OR floats, representing sides.
Output: a string identifying whether the triangle is isoceles, equilateral, or
scalene.

Rules
Explicit:
* we do have to check for validity of a triangle at all, meeaning all sides
  are greater than zero, and the sum of any two sides must be greater than
* equilateral triangle = all sides equal
* isosceles triangles means exactly two sides are the same
* scalene means no side is the same
  the third.
Implicit:
* Equaletaral triangles are actually a form of isosceles as well since 2
  side are equal
* we don't know exactly how measurements will be given, so validation for integer
or float is good.

Algorithm:
* Validate the input at all - are they actually integers or floats, if not
return an error (lets stick with integers first)
* validate that the values constitute an actually valid triangle
  * are all sides greater than 0? :DONE
  * do any two add up to less than the third? :DONE
      1st side + 2nd side < 3rd side
      1st side + 3rd side < 2nd side
      2nd side + 3rd side < 1st side
* iterate through the values
    * return equilateral if any value.count == 3 :DONE
    * return isosceles if any value.count == 2
* if neither of the above were trigger during the loop, return scalene


perhaps there is a mathematical way to represent this. I think I could do
  something fancy, but in the end this is a simple thing with a simple array
  so I will just make it a manual formula for now
=end

class Triangle
  attr_accessor :kind

  def initialize(side1, side2, side3)
    @sides_array = [side1, side2, side3]
    raise ArgumentError, "Invalid Triangle" unless valid_triangle?
    @kind = determine_kind
  end

  def determine_kind
    @sides_array.each do |side|
      count = @sides_array.count(side)
      case count
      when 3 then return 'equilateral'
      when 2 then return 'isosceles'
      end
    end

    'scalene'
  end

  def valid_sides?
    side1, side2, side3 = @sides_array
    side1 + side2 > side3 &&
    side1 + side3 > side2 &&
    side2 + side3 > side1
  end

  def valid_triangle?
     @sides_array.any? { |side| side > 0 } && valid_sides?
  end
end

