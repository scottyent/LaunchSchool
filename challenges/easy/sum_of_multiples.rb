# Write a program that, given a natural number and a set of one or more other
# numbers, can find the sum of all the multiples of the numbers in the set that
# are less than the first number. If the set of numbers is not given, use a
# default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including,
# 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18.
# The sum of these multiples is 78.

# Input: a bit confusing on the instructions, but based on the tests, we initialize
# with a set of numbers, then call a .to method on the object to specify
# an upper limit of where to find multiples up to, but to also returns the sum
# Output: looks like we're testing the .to method here, which returns a sum
# of all the multiples of the given numbers in the set, up to the given .to
# number

# Rules
# Explicit:
# * it's up to but not including that upper limit number
# * there has to be a default set of 3,5 in case no set is given
# * .to method for the object will use
# Implicit:
# * the .to method is actually a class method, but you can initialize an object
#  and then call the class method on it?....

# Algorithm:
# * I mean this is crazy but what if I simply set the class variable to [3,5]
# * then when initializing an object it actually modifies the class variables instead
# * and I alias an instance method back to the class method which would then
# * hvae the updated class variables.

# Algo for actually figuring out the multiples:
# do upto iteration, and within that have an iteration over the class variable
# set of numbers and test each one to see if it's evenly divisble into the current
# number, and add it to multiples if it is. In the end, sum that multiples result.

# class SumOfMultiples
#   @@number_set = [3, 5]

#   def initialize(*numbers)
#     @given_numbers = numbers
#   end

#   def self.to(upperlimit, range=@@number_set)
#     multiples = []

#     (1...upperlimit).to_a.each do |num|
#       range.each do |divisor|
#         multiples << num if num % divisor == 0
#       end
#     end

#     multiples.uniq.sum
#   end

#   def to(high)
#     self.class.to(high, @given_numbers)
#   end
# end

class SumOfMultiples
  def initialize(*numbers)
    @given_numbers = numbers.empty? ? [3, 5] : numbers
  end

  def self.to(upperlimit)
    self.new.to(upperlimit)
  end

  def to(high)
    multiples = []

    (1...high).to_a.each do |num|
      @given_numbers.each do |divisor|
        multiples << num if num % divisor == 0
      end
    end

    multiples.uniq.sum
  end
end
