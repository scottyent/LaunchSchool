# Input: 2 different arrays of varying sizes, of integers
# Output: 1 array containing the product of all permutations of numbers, sorted from smallest to biggest

# Rules
# You can assume both arrays are not empty

# Algo
# Not doing well with permutation so I'll try something else
# Nested loops to add to products array

require 'pry'
require 'pry-byebug'

# def multiply_all_pairs(array1, array2)
#   products = []

#   array1.each do |num1|
#     array2.each do |num2|
#       products << num1 * num2
#     end
#   end

#   products.sort
# end

# Just exploring their solution to understand it better
# I didn't realize you could assign num1, num2 like that in an iterator
# when iterating over multiply arrays!
def multiply_all_pairs(array_1, array_2)
  product_array = array_1.product(array_2)
  numbers = product_array.map do |num1, num2|
    num1 * num2
  end

  numbers.sort
  binding.pry
end
# Test cases
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]