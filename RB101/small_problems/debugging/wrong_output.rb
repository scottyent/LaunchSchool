# Josh wants to print an array of numeric strings in reverse numerical order.
# However, the output is wrong. Without removing any code, help Josh get the expected output.
# This has something to do with the strength of bindings. I think P is binding stronger to
# array than array is to sort, so it's executing p arr before any sort is called
# to fix this, you can wrap the block/call in parentheses or assign the output of sort
# to a new variable
# Another option is using {} instead of a do..end block

require 'pry'
require 'pry-byebug'

arr = ["9", "8", "7", "10", "11"]
sorted =  arr.sort do |x, y|
    y.to_i <=> x.to_i
  end
p sorted

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]