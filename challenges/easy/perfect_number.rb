=begin
The Greek mathematician Nicomachus devised a classification scheme for natural
numbers (1, 2, 3, ...), identifying each as belonging uniquely to the categories
of abundant, perfect, or deficient based on a comparison between the number and
the sum of its positive divisors (the numbers that can be evenly divided into
  the target number with no remainder, excluding the number itself).
  For instance, the positive divisors of 15 are 1, 3, and 5. This sum is known
  as the Aliquot sum.

Perfect numbers have an Aliquot sum that is equal to the original number.
Abundant numbers have an Aliquot sum that is greater than the original number.
Deficient numbers have an Aliquot sum that is less than the original number.

Write a program that can tell whether a number is perfect, abundant,
or deficient.

Ok this seemed complicated at first, but reading over the requirements it seems
pretty straight forward.

Algo:
take a number, iterate from 1 to the number minus, if the modulo of iterated
number into the original number equals zero, then add that into a divisor array
lastly sum that array and if it's
equal to number -> perfect
less than number it's deficient
greater than number it's abundant

=end

class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1

    divisors = []

    (1...number).each do |divisor|
      divisors << divisor if number % divisor == 0
    end

    aliquot_sum = divisors.sum

    case aliquot_sum
    when number then 'perfect'
    when 1...number then 'deficient'
    when (number + 1).. then 'abundant'
    end
  end
end
