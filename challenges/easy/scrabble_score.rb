# Write a program that, given a word, computes the Scrabble score for that word.

=begin
I'm given a table with the appropriate values for each letter.
The algorithm is pretty straight forward:

1. createa a data structure (likely a Hash) that allows you to match the letter
to the appropriate value
2. Create score variable to keep track of score
3. Split the string into characters and iterate through it, adding appropriate
poitns to the score
  3a. to find the match since I will be using .include? instead of a direct key
  match, iterate through the hash itself so you can use key, value to use the
  value once the key contains the letter
4. return the score

- not case sensitive so downcase the word when initializing
- empty, whitespace, or nil values produce 0 so initialize score to 0
=end

class Scrabble
  attr_accessor :word

  TILE_SCORES = {
    'aeioulnrst' => 1,
    'dg' => 2,
    'bcmp' => 3,
    'fhvwy' => 4,
    'k' => 5,
    'jx'=> 8,
    'qz' => 10
  }
  def initialize(word)
    @word = word.downcase if word
  end

  def score(term=@word)
    return 0 unless term

    score = 0
    term.chars.each do |letter|
      TILE_SCORES.each { |letters, scores| score += scores if letters.include?(letter) }
    end
    score
  end

  def self.score(new_term)
    Scrabble.new(new_term).score
  end
end