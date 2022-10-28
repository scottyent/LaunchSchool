def group_and_count(arr)
  return nil if arr.empty? || arr == nil
  uniq_array = arr.uniq

  uniq_array.each_with_object({}) do |num, results|
    results[num] = arr.count(num)
  end
end

# Test Cases
p group_and_count([0,1,1,0]) ==  {0=>2, 1=>2}