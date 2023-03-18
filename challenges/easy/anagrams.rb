# Write a program that takes a word and a list of possible anagrams and selects
# the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists",
# "google", "inlets", and "banana", the program should return a list containing
# "inlets". Please read the test suite for the exact rules of anagrams.

=begin
Algorithm:
* create a Anagram class that when instantiated takes the base word
* create a match function that returns a list of words that are actually anagrams
  * create a helper function that is anagram?, then just use select
* anagram?
  * string to chars sort compared to the other one same
    * does it need to be case sensitive?
      - case insensitive BUT it can't be the same word as the original
    * what about punctuation?
        -punctuation isn't tested

=end

class Anagram
  def initialize(word)
    @word= word.downcase
  end

  def match(potentials_array)
    potentials_array.select do |possible_match|
      lowercase_word = possible_match.downcase
      lowercase_word == @word ? false : anagram?(lowercase_word)
    end
  end

  private

  def anagram?(second_word)
    @word.chars.sort == second_word.chars.sort
  end
end
