[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

[5, 6].map do |el|
  if 5.to_s.size == 1    # it's an integer
    5 + 1
  else                    # it's an array
    el.map do |n|
      n + 1
    end

    maps output with the second array = [6,7]

    [[[1, 2], [3, 4]], [5, 6]].map do |arr|

      outer return has this available to it
      second round = [6, 7]
      First round = [[2, 3][4, 5]]

      but this all goes into a new array, so [[[2, 3], [4, 5]], [6, 7]]


  [[1, 2], [3, 4]].map do |el|  =>    [2, 3][4, 5]
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      [2, 3]
      end
    end
  end
end

[1,1,3,6,9]