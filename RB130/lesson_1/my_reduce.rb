# TODO:
# Takes one collection
# Takes an optional parameter for starting point of accumulation
# passes both the current number, and the cumulator to the block, does calc
## then assigns the return value to the cumulator value
require 'pry'
require 'pry-byebug'

def my_reduce(collection, starting_point=collection[0])
  total = starting_point
  index = starting_point == collection[0] ? 1 : 0

  while index < collection.size
    total = yield(total, collection[index])
    index += 1
  end

  total
end

array = [1, 2, 3, 4, 5]

p my_reduce(array) { |acc, num| acc + num }                    # => 15
p  my_reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p my_reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p my_reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']