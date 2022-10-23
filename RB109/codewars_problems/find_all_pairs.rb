=begin
Input: array of integers
Output: sum of how many pairs exist

Rules
0 or 1 value arrays return 0
each pair counts once, and there can be multiple pairs of the same number


Steps:
return 0 if array size is under 2 :DONE
intialize pairs variable to zero :DONE
intialize a checked numbers empty array :DONE

iterate through each number
  if the number is in the checked numbers array, skip this iteration
  if not, then check the count and if the count > 1, add count / 2 to the pairs variable. then add number to checked array

=end

def pairs(num_array)
  return 0 if num_array.size < 2
  pairs = 0
  checked_numbers = []

  num_array.each do |number|
    if checked_numbers.include?(number)
      next
    else
      checked_numbers << number
      freq = num_array.count(number)
      pairs += freq / 2 if freq > 1
    end
  end

  pairs
end

# Test Cases
p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0