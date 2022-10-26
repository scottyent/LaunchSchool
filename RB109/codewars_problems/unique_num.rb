def find_uniq(arr)
  small_arr = arr[0..2]
  check_num = 0
  small_arr.each do |num|
    if small_arr.count(num) == 1
      return num
    else
      check_num = arr[0]
    end
  end

  arr.each { |num| return num if num != check_num }
end

# Test Cases
p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) ==  0.55