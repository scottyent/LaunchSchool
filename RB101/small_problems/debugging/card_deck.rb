=begin
We started working on a card game but got stuck.
Check out why the code below raises a TypeError.

Once you get the program to run and produce a sum,
you might notice that the sum is off:
It's lower than it should be. Why is that?

Answer: The sum function at the end throws an error
because it's trying to sum a symbol (:jack) which makes
it clear that the function above it didn't convert card names
to scores. The map fucntion returns a new array, but it didn't
assign it to everything, so I assigned the result back to itself.

To fix the sum, this was tough. I didn't notice the object of cards
was being mutated each time within the player cards section.

I peaked at the hint, and then to solve this I actually used map
to create a duplicate array of the cards, but it would have been more straight
forward just to clone/dup the cards array for each suit
=end

require 'pry'
require 'pry-byebug'

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit].map { |card| card }
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (key, remaining_cards)|
  scores = remaining_cards.map do |card|
    score(card)
  end

  sum += scores.sum
end

puts sum