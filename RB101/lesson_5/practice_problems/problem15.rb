# Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

result = arr.select do |hash|
  array = hash.values.flatten
  all_integers = true
  array.each { |number| all_integers = false if number.odd? }
  all_integers
end


p result