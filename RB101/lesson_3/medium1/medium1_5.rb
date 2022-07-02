def fib(first_num, second_num)
  limit = 15
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

=begin
The issue was that methods have their own scope, and limit was defined outside that scope.
To fix this, we can move limit inside the method, or pass limit into the method as a 3rd parameter.
=end