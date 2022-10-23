=begin
Input: a string
Output: a hash with the key as a symbol of the char, and the value being the frequency it appears

Rules
only count lowercase
it's symbols as keys, NOT strings


Steps:
intilize a frequency hash or use a each with object iteration
break string into an array with charsi
if char.downcase! == nil
then check if hash includes the key char.to_sym
if not, initialize it with 1
otherwise, increment it by one, return the hash
=end

require 'pry'
require 'pry-byebug'


def letter_count(str)
  frequency = {}
  letters = str.chars

  letters.each do |letter|
    if letter.downcase! == nil
      binding.pry
      if frequency.include?(letter.to_sym)
        frequency[letter.to_sym] += 1
      else
        frequency[letter.to_sym] = 1
      end
    end
  end

  frequency
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}