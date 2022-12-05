class Card
  attr_accessor :suit, :value

  def initialize(suit, number)
    @suit = suit
    @value = number
  end

  def draw
    puts "=> #{convert_suit_to_symbol(suit)}#{value}"
    # horizontal = "--------------"
    # num_line = "|#{value}" +
    #         "#{' ' * (horizontal.size - 2 - (value.size * 2))}" + "#{value}|"
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
  def display_cards(hide_second: false)
    if hide_second
      hand[0].draw
    else
      hand.each(&:draw)
    end

    puts "--- Total: #{total} ---"
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
    ace_cards.each do |_|
      current_total = current_values.sum

      current_values << (current_total + 11) > 21 ? 1 : 11
    end

    current_values
  end

  def busted?
    if total > 21
      @busted = true
      true
    else
      false
    end
  end
end

class Player
  attr_reader :name
  attr_accessor :stay, :busted, :hand

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
      loop do
        deal_cards
        show_initial_cards
        initial_21_check
        break if game_over
        player_turn until player.busted? || player.stay
        break if player.busted
        dealer_turn until dealer.busted? || minimum?
        break
      end
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
      if player.busted
        puts "You busted. Better luck next time."
      else
        puts "The dealer busted. You win!"
      end
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
    puts "--- Dealer ---"
    dealer.display_cards
    divider
    puts "--- Your cards ---"
    player.display_cards
  end

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
    self.game_deck = Deck.new
    @player.hand = []
    @dealer.hand = []
    @player.busted = false
    @dealer.busted = false
    @player.stay = false
    @game_over = false
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
    dealer.display_cards
    sleep 1

    puts "Dealer draws another card..."
    sleep 1
    clear_screen
    dealer.hit(game_deck)
    dealer.display_cards(hide_second: false)
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
    sleep 1
    clear_screen
    puts "--- Dealer ---"
    dealer.display_cards(hide_second: true)
    divider
    puts "--- Your cards ---"
    player.display_cards
    divider
  end

  def display_welcome_message
    clear_screen
    puts "---- Welcome to 21! -----"
    sleep 1
  end

  def clear_screen
    system 'clear'
  end

  def divider
    puts
  end
end

TwentyOneGame.new.start
