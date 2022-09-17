# Input: an array and a search value
# Output: boolean value depending on if the array includes the search item or not (just building include? without using it)

# Rules
# can't use the include? method
# Haas to handle all sorts of elements (examoles include integers and nil)

# Algo
# iterate through
# equality operator with the search term
# return true if match
# otherwise return false

def include?(array, search_term)
  array.each { |item| return true if item == search_term}

  false
end



# Test Cases
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false