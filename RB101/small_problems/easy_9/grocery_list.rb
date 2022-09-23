# Input: A grocery list array (array of arrays)
# Output: an array with the name of each item replicated as many times as the quantity stated

# Rules
# Can I assume there's always a quantity?
# Does the structure stay consistent?

# Algo
# Iterate over the main array with map
# just return array[0] * array[1] to map which will create the array
# This was wrong bc that just multiplies a string and I need

def buy_fruit(groceries)
  result = []
  groceries.each do |fruit, quantity|
    quantity.times { |_| result << fruit }
  end
  result
end

# Test Cases
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]