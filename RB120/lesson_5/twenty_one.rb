require 'pry'
require 'pry-byebug'

# TODO
# - reduce the complexity of show_result?

class Card
  attr_accessor :suit, :value

  def initialize(suit, number)
    @suit = suit
    @value = number
  end

  def draw
    p "#{convert_suit_to_symbol(suit)}#{value}"
    # horizontal = "--------------"
    # num_line = "|#{value}" +
    #           "#{' ' * (horizontal.size - 2 - (value.size * 2))}" + "#{value}|"
    # blank_line = "|#{' ' * (horizontal.size - 2)}|"

    # puts horizontal
    # puts num_line
    # puts blank_line
    # puts blank_line
    # puts "|     #{convert_suit_to_symbol(suit)}      |"
    # puts blank_line
    # puts blank_line
    # puts blank_line
    # puts num_line
    # puts horizontal
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

module Hand
  def display_cards(hide_second:false)
    if hide_second
      hand[0].draw
    else
      hand.each do |card|
        card.draw
      end
    end

    nil
  end

  def hit(deck)
    hand << deck.deal
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
    end

    if !aces.empty?
      values = adjust_for_aces(values, aces)
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
    if total > 21
      @busted = true
      return true
    else
      return false
    end
  end
end

class Player
  attr_reader :name, :hand
  attr_accessor :stay, :busted

  include Hand

  def initialize
    @hand = []
    @stay = false
    @busted = false
  end

  # Unused but I'll keep it in case they implement that
  # def ask_name
  #   loop do
  #     puts 'What is your name?'
  #     response = gets.chomp.capitalize
  #     return response if !response.empty?
  #     puts "That's not a valid name"
  #   end
  # end
end

class Dealer
  include Hand

  attr_accessor :hand, :busted

  def initialize
    @hand = []
    @busted = false
  end
end

# Game Orchestration
class TwentyOneGame
  attr_accessor :player, :dealer, :game_deck, :game_over

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @game_deck = Deck.new
    @game_over = false
  end

  def start
    display_welcome_message

    loop do
      deal_cards
      show_initial_cards
      initial_21_check
      break if game_over
      player_turn until player.busted? || player.stay
      break if player.busted
      dealer_turn until dealer.busted? || minimum?
      show_result
      break unless play_again?
      reset_game
    end
  end

  def show_result
    clear_screen
    if player.total == 21 || dealer.total == 21
      if player.total == 21 && dealer.total == 21
        puts "It's a tie! You both got 21."
      elsif dealer.total == 21
        puts "You lose! The dealer has 21."
      elsif player.total == 21
        puts "Congrats! You won with 21."
      end
    elsif player.busted || dealer.busted
      puts player.busted ? "You busted. Better luck next time." : "The dealer busted. You win!"
    else
      if dealer.total == player.total
        puts "It's a tie"
      elsif dealer.total > player.total
        puts "Dealer wins."
      else
        puts "You win!"
      end
    end

    divider
    puts "The final cards are:"
    divider
    puts "Dealer"
    puts "Total: #{dealer.total}"
    dealer.display_cards
    divider
    puts "Your cards"
    puts "Total: #{player.total}"
    player.display_cards
  end

    # Possible outcomes, in order of outcome
    # Dealer has 21, player does too -> tie
    # Dealer has 21, player doesn't -> dealer wins
    # player has 21, dealer doesn't -> player wins

    # If player busted -> dealer wins
    # if dealer busted and player didn't bust -> player wins

    # Lastly
    # totals compared, bigger one wins


  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "That's not a valid response."
    end

    answer == 'y'
  end

  def reset_game
    @game_deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end


  def player_turn
    move = nil
    loop do
      puts "Do you want to hit, or stay? (h/s)"
      move = gets.chomp.downcase
      break if %w(hit stay h s).include?(move)
      puts "That's not a valid choice"
    end

    if %w(hit h).include?(move)
      player.hit(game_deck)
      clear_screen
      player.display_cards
      puts "Total: #{player.total}"
    else
      player.stay = true
      puts "You've chosen to stay. Dealers turn!"
      sleep 1
    end
  end

  def minimum?
    dealer.total >= 17
  end

  def dealer_turn
    clear_screen
    puts "Dealer Total: #{dealer.total}"
    dealer.display_cards
    sleep 1

    puts "Dealer draws another card..."
    sleep 1
    clear_screen
    dealer.hit(game_deck)
    puts "Dealer Total: #{dealer.total}"
    dealer.display_cards(hide_second:false)
    sleep 1
  end

  def initial_21_check
    if dealer.total == 21
      @game_over = true
      puts "Dealer has blackjack. You lose."
    elsif player.total == 21
      @game_over = true
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
    sleep 1
    clear_screen
    puts "Dealer:"
    puts "#{dealer.display_cards(hide_second:true)}"
    puts "You:"
    puts "#{player.display_cards} Total: #{player.total}"
    divider
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to 21!"
    divider
    sleep 1
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
