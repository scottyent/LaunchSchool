# Write a program that can calculate the Hamming distance between two DNA strands.

=begin
Input: two string sequences of ANY length (ideally the same but doesn't have to be)
Output: a number representing the number of point mutations between the two

Rules
Explicit:
* If the strings are the same size, compare the shorter parts that overlap
* Any difference between index values constitutes a mutation
Implicit:
* We're given valid strings that represent DNA
* empety strings return 0 (based on tests)

Algorithm:
Seems pretty straight forward.
* Set the amount of times to iterate by the shortest string length
* Initialize a mutations variable to zero
* iterate length.times over, using that number as an index.
* any time the numbers don't match, increment the mutations
* return the mutations
=end

class DNA
  def initialize(dna1)
    @dna1 = dna1
  end

  def hamming_distance(dna2)
    mutations = 0
    length = @dna1.size < dna2.size ? @dna1.size : dna2.size
    length.times { |index| mutations += 1 if @dna1[index] != dna2[index] }

    mutations
  end
end
