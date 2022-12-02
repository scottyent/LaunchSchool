require 'pry'
require 'pry-byebug'

module Hand
  def hit

  end

  def stay

  end

  def total
    # mechanism for summing their hand
  end

  def busted?

  end
end

class Player
  attr_reader :name, :hand

  include Hand

  def initialize
    @name = ask_name
    @hand = []
  end

  def ask_name
    loop do
      puts 'What is your name?'
      response = gets.chomp.capitalize
      return response if !response.empty?
      puts "That's not a valid name"
    end
  end
end

class Dealer
  include Hand

  attr_accessor :hand

  def initialize
    @hand = []
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = new_deck
  end

  def new_deck
    fresh_deck = []
    suits = %w(Heats Diamonds Spades Clubs)
    values = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
    suits.each do |suit|
      values.each { |value| fresh_deck << Card.new(suit, value) }
    end

    fresh_deck
  end

  def deal
    card = cards.sample
    cards.delete(card)
    card
  end
end

class Card
  def initialize(suit, number)
    @suit = suit
    @value = number
  end
end

# Game Orchestration
class TwentyOneGame
  attr_accessor :player, :dealer, :game_deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @game_deck = Deck.new
  end

  def start
    display_welcome_message
    deal_cards
    binding.pry
    show_initial_cards
    # check_for_21
    # player_turn until busted? || stay
    # dealer_turn until busted? || minumum
    # show_result
  end

  def deal_cards
    players = [player, dealer]
    players.each do |person|
      2.times { |_| person.hand << game_deck.deal }
    end
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to 21!"
  end

  def clear_screen
    system 'clear'
  end
end

TwentyOneGame.new.start




=begin
Description of the game written out.

21 is a card game that is played with a deck of 52 cards. The player and the
dealer are each dealt 2 card, with the players cards being visible, and the
dealers cards showing the 2nd card dealt. The player can then decide to hit
or stay (add to or keep current hand), with the goal of getting as close to 21
as possible and/or higher than the dealer. The dealer goes after the player,
and can hit until it reaches at least 17. Anything over 21 for either is an
immediate loss.

so in tha analysis, the nouns that pop out to be as repeated often are:
- Player
- Dealer
- Cards/deck

The verbs that pop out at me are:
- Hit
- Stay
- Deal

Ok lets see what the official LaunchSchool answer is:
Description:
Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.

Here is an overview of the game:
- Both participants are initially dealt 2 cards from a 52-card deck.
- The player takes the first turn, and can "hit" or "stay".
- If the player busts, he loses. If he stays, it's the dealer's turn.
- The dealer must hit until his cards add up to at least 17.
- If he busts, the player wins. If both player and dealer stays, then the highest total wins.
- If both totals are equal, then it's a tie, and nobody wins.

Nouns: card, player, dealer, participant, deck, game, total
Verbs: deal, hit, stay, busts

So I'll take a crack at organizing their version with the verbs:

card
player
-hit
-stay
-busts
-total
dealer
-hit
-stay
-busts
-total
-deal (here or in deck?)
participant
deck
- deal (here or in dealer?)
game
- start

alright, ready to spike and start checking out these structures
=end
