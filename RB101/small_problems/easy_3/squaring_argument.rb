def multiply(num1, num2)
  num1 * num2
end

def power_to(number, exponent)
  total = 0
  while exponent > 0
    if exponent == 1
      total *= number
      exponent -= 1
    else
      total += multiply(number, number)
      exponent -= 2
    end
  end
  total
end
