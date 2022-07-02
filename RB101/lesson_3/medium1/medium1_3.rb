def factors(number)
  divisor = number
  factors = []
  begin
    return "Invalid Number" if divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

p factors(10002022)

=begin
Bonus 1
What is the purpose of the number % divisor == 0 ?
That is the test statement since a factor is a number that is evenly divided by another, so there has to be no remainder

Bonus 2
What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?
Ruby implicitly returns the last evaluated item out of a method, so by putting factors last there, it returns in

Answer provided:

while divisor > 0
  factors << number / divisor if number % divisor == 0
  divisor -= 1
end

=end