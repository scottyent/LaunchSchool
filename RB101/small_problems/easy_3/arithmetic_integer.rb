# Input: 2 numbers (no need to validate)
# Output: sentence showing all operations done with those two numbers

# Algo
# It's really quite simple, but maybe there's a way to do it more efficiently.
# You can't substitute operators... I've tried that.
# Nah I'll just keep it simple

OPERANDS = [:+, :-, :*, :/, :%, :**]

def calculate(num1, num2, calculation)
  [num1, num2].inject(calculation)
end

puts "Please enter the first number"
number1 = gets.chomp.to_f

number2 = 0
loop do
  puts "Please enter the second number"
  number2 = gets.chomp
  if number2.to_i.to_s == number2
    if number2.to_i == 0
      puts "You can't have zero as a denominator"
      next
    else
      number2 = number2.to_f
      break
    end
  else
    puts "That's not a valid number"
  end
end


OPERANDS.each do |operation|
  puts "#{number1} #{operation.to_s} #{number2} = #{calculate(number1, number2, operation)}"
end
