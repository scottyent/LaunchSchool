# Write a program that will take a string of digits and return all the possible
# consecutive number series of a specified length in that string.

# For example, the string "01234" has the following 3-digit series:

# 012
# 123
# 234
# Likewise, here are the 4-digit series:

# 0123
# 1234
# Finally, if you ask for a 6-digit series from a 5-digit string, you should
# throw an error.

# Input: Series class, which initializes with a number (as a string). Calling
# the class method slices, you take an integer representing the size of the
# slices you want to return
# Output: An array filled with arrays containing the slices (now integers)
# in the size requsted in the slicing method

# Rules
# Explicit:
# * if the request for a slice is larger than the size of the number, throw error
# specifically use ArgumentError
# Implicit:
# * It's slices including overlap E.g. it's not [1,2,3,4] -> [[1,2][3,4]] but rather [[1,2], [2,3], [3,4]]

# Algorithm:
# * initialize an object from the Series class :DONE
# * assign the string to a instance variable :DONE
# * create instance method that accepts integer for size of slices :DONE
# * break apart the string into chars, then map to integers :DONE
# * iterate from 0 to size of string (or currently, array) minus size of slice :DONE
# * use the number as the index and shove slices into a results array :DONE
# * raise error if slice size too big :DONE

class Series
  def initialize(number)
    @string_num = number
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > @string_num.size

    int_array = @string_num.chars.map(&:to_i)
    last_index = int_array.size - slice_size

    (0..last_index).each_with_object([]) do |index, results|
      results << int_array[index, slice_size]
    end
  end
end
