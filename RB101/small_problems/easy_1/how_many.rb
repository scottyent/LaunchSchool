# Input: array of strings
# Output: A Hash of keys with their frequency as the value

# Rules
# The words in the array are case sensitive so suv != SUV
# The output should be formatted in the following form:
# format = <<MSG
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
# MSG

# Algorithm
# Create an empty hash for the results
# Iterate through the array, adding keys to the hash with a default value of 1
# If the key already exists, increment the value by 1
# Create a formatted message that displays the keys and values as requested


# Implementation 1
def count_occurrences(array)
  result_hash = Hash.new("Key not found")
  array.each do |vehicle|
    if result_hash[vehicle] == "Key not found"
      result_hash[vehicle] = 1
    else
      result_hash[vehicle] += 1
    end
  end
  result_hash.each do |vehicle, frequency|
    puts "#{vehicle} => #{frequency}"
  end
end

# Their solution
# def count_occurrences(array)
#   occurrences = {}

#   array.uniq.each do |element|
#     occurrences[element] = array.count(element)
#   end

#   occurrences.each do |element, count|
#     puts "#{element} => #{count}"
#   end
# end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

