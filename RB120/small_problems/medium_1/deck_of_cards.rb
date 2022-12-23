# Using the Card class from the previous exercise, create a Deck class that
# contains all of the standard 52 playing cards. Use the following code to
# start your work:

require 'pry'
require 'pry-byebug'

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :full_deck

  def initialize
    @full_deck = new_deck
  end

  def draw
    self.full_deck = new_deck if full_deck.empty?
    full_deck.pop
  end

  private

  attr_writer :full_deck

  def new_deck
    temp_deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        temp_deck << Card.new(rank, suit)
      end
    end

    temp_deck.shuffle
  end
end

# The Deck class should provide a #draw method to deal one card. The Deck should
# be shuffled when it is initialized and, if it runs out of cards, it should
# reset itself by generating a new set of 52 shuffled cards.

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

# Test Cases

deck = Deck.new

drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.