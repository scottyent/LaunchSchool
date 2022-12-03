require 'pry'
require 'pry-byebug'

# TODO
# - uncomment the sleep lines when ready to play!



module Hand
  def display_cards
    hand.each do |card|
      card.draw
    end

    nil
  end

  def hit(deck)
    hand << deck.deal
  end

  def stay

  end

  def total
    values = []
    aces = []
    hand.each do |card|
      if card.value == 'A'
        aces << card.value
      elsif %w(J Q K).include?(card.value)
        values << 10
      else
        values << card.value.to_i
      end

      if !aces.empty?
        values = adjust_for_aces(values, aces)
      end
    end

    values.sum
  end

  def adjust_for_aces(current_values, ace_cards)
    # Checks each ace, decides if should be 1 or 11, and adds that to the values
    ace_cards.each do |ace|
      current_total = current_values.sum

      if (current_total + 11) > 21
        current_values << 1
      else
        current_values << 11
      end
    end

    current_values
  end

  def busted?
    hand.total > 21
  end
end

class Player
  attr_reader :name, :hand

  include Hand

  def initialize
    @name = 'Player'
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
    suits = %w(Hearts Diamonds Spades Clubs)
    values = %w(2 3 4 5 6 7 8 9 10 J Q K A)
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
  attr_accessor :suit, :value

  def initialize(suit, number)
    @suit = suit
    @value = number
  end

  def draw
    horizontal = "--------------"
    num_line = "|#{value}" +
              "#{' ' * (horizontal.size - 2 - (value.size * 2))}" + "#{value}|"
    blank_line = "|#{' ' * (horizontal.size - 2)}|"

    puts horizontal
    puts num_line
    puts blank_line
    puts blank_line
    puts "|     #{convert_suit_to_symbol(suit)}      |"
    puts blank_line
    puts blank_line
    puts blank_line
    puts num_line
    puts horizontal
  end

  def convert_suit_to_symbol(string_suit)
    symbols = {
      'Hearts' => "\u{02665}",
      'Diamonds' => "\u{02666}",
      'Spades' => "\u{02660}",
      'Clubs' => "\u{02663}"
    }

    symbols[string_suit]
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
    display_welcome_message # DONE
    deal_cards
    show_initial_cards
    initial_21_check
    # player_turn until busted? || stay
    # dealer_turn until busted? || minumum
    # show_result
  end

  def initial_21_check
    if dealer.total == 21
      puts "Dealer has blackjack. You lose. "
    elsif player.total == 21
      puts "You have blackjack! You win!"
    end
  end

  def deal_cards
    players = [player, dealer]
    players.each do |person|
      2.times { |_| person.hand << game_deck.deal }
    end
  end

  def show_initial_cards
    clear_screen
    puts "Dealing your cards..."
    divider
    # sleep 1
    puts "Dealer:"
    puts "#{dealer.hand[0].draw}"
    puts "You:"
    puts "#{player.display_cards} Total: #{player.total}"
    divider
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to 21!"
    divider
    # sleep 1
  end

  def clear_screen
    system 'clear'
  end

  def divider
    puts "-" * 14
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

alright, ready to spike and start checK out these structures
=end
