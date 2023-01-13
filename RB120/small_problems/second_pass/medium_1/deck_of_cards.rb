# Using the Card class from the previous exercise, create a Deck class that
# contains all of the standard 52 playing cards. Use the following code to
# start your work:

require 'pry'
require 'pry-byebug'


class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck_holder = new_deck
  end

  def new_deck
    temp_deck = []

    SUITS.each do |suit|
      RANKS.each do |rank|
        temp_deck << Card.new(rank, suit)
      end
    end

    temp_deck.shuffle
  end

  def draw
    self.deck_holder = new_deck if deck_holder.empty?
    deck_holder.pop
  end

  private

  attr_accessor :deck_holder
end

class Card
  include Comparable
  attr_reader :rank, :suit

  FACE_CARDS = %w(Jack Queen King Ace)
  FACE_TO_NUM = {
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13,
    'Ace' => 14
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def rank_to_num(value)
    FACE_CARDS.include?(value) ? FACE_TO_NUM[value] : value
  end

  def <=>(other)
    card1 = rank_to_num(rank)
    card2 = rank_to_num(other.rank)
    card1 <=> card2
  end
end

# The Deck class should provide a #draw method to deal one card. The Deck should
# be shuffled when it is initialized and, if it runs out of cards, it should
# reset itself by generating a new set of 52 shuffled cards.

# Tests
deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.