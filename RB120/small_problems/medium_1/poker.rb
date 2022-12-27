# In the previous two exercises, you developed a Card class and a Deck class.
# You are now going to use those classes to create and evaluate poker hands.
# Create a class, PokerHand, that takes 5 cards from a Deck of Cards and
# evaluates those cards as a Poker hand.

# You should build your class using the following code skeleton:

# Include Card and Deck classes from the last two exercises.

require 'pry'
require 'pry-byebug'

class PokerHand
  include Comparable
  attr_reader :hand, :hand_as_numbers, :hand_name

  def initialize(*args)
    @hand = validate_hand(*args)
    @hand_as_numbers = convert_hand_to_num
    @hand_name = evaluate
  end

  def validate_hand(cards)
    if cards.class == Deck
      choose_hand(cards)
    elsif cards.size == 5
      cards
    else
      raise ArgumentError, "You can only input 5 cards or a whole deck"
    end
  end

  def print
    hand.each { |card| puts card }
  end

  def choose_hand(deck)
    temp_hand = []

    5.times { |_| temp_hand << deck.draw }

    temp_hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def convert_hand_to_num
    face_converter = {
      'Jack' => 11,
      'Queen' => 12,
      'King' => 13,
      'Ace' => 14
    }

    @hand.map do |card|
      (2..10).cover?(card.rank) ? card.rank : face_converter[card.rank]
    end.sort
  end

  def royal_flush?
    (10..14) == (hand_as_numbers.first..hand_as_numbers.last) &&
      flush?
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    hand_as_numbers.each do |card|
      return true if hand_as_numbers.count(card) == 4
    end

    false
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    suits = hand.map { |card| card.suit}
    suits.uniq.size == 1
  end

  def straight?
    (hand_as_numbers.first..hand_as_numbers.last).to_a == hand_as_numbers
  end

  def three_of_a_kind?
    hand_as_numbers.each do |card|
      return true if hand_as_numbers.count(card) == 3
    end

    false
  end

  def two_pair?
    pairs = []
    hand_as_numbers.each do |card|
      pairs << card if hand_as_numbers.count(card) == 2
    end

    pairs.uniq!
    pairs.size == 2
  end

  def pair?
    hand_as_numbers.each do |card|
      return true if hand_as_numbers.count(card) == 2
    end

    false
  end

  def <=>(other)
    name_to_num = {
    'Royal flush' => 10,
    'Straight flush' => 9,
    'Four of a kind' => 8,
    'Full house' => 7,
    'Flush' => 6,
    'Straight' => 5,
    'Three of a kind' => 4,
    'Two pair' => 3,
    'Pair' => 2,
    'High Card' => 1
  }

    if hand_name == 'High card' && other.hand_name == 'High card'
      hand_as_numbers.max <=> other.hand_as_numbers.max
    else
      name_to_num[hand_name] <=> name_to_num[other.hand_name]
    end
  end
end

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

# Testing
# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])

puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'


# Test hand comparison

# Royal flush vs Straight flush

hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])

hand2 = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])

puts hand > hand2 # true

# Testing High card

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])

hand2 = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('Ace', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])

puts hand2 < hand # false
puts hand2 > hand # true