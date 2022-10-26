# This code works, but fails the efficency test in codewars (times out) need to refactor

=begin
Input: an array of integers, and a number to sum to
Output: two numbers that sum to that sum, from within the array

Rules
there might be multiple
return nil if there's no match
work from left to right
they don't have to be consecutive

if multiple solutions, return the pair whose
  second element has the smallest index

Steps:
iterate over the array, maybe with index
if number is less than the sum number
  iterate over the remaining array, and check if those numbers + current num == sum
  if they do, create an array, and shove it into results

if the number of saved couples is greater than 1, pass to
  a helper function that min_by to_s to the -1 place in the string
=end

def sum_pairs(arr, sum)
  results = {}

  arr.each_with_index do |number, index|
      arr[index + 1..-1].each_with_index do |num,in_idx|
        if num + number == sum
          results[[number, num]] = [index, index + in_idx + 1]
        end
      end
  end

  if results.keys.size > 1
    lower_index = results.values.min_by { |pair| pair[-1] }
    results = results.select { |k, v| v == lower_index }
  end

  results.empty? ? nil : results.keys.flatten
end


# Test Cases
l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]

p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]