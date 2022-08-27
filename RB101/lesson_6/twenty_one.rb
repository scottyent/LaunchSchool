# 1. Initialize deck :DONE
  # Try looping to create a 52 value array :DONE
# 2. Deal cards to player and dealer
  #  Use a hash with arrays as a value for cards
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

# Data structure decision
# Personally, I think a hash with an array as a value is a good way to do keep the values of the dealt cards. That way you can easily take advantage of
# The sum feature of an array, and can easily store/access which player has what.
# What about the deck itself?
# I could do a hash with each type of card (Spade, heart etc) with an array representing the values, but then I wouldn't konw how to shuffle and deal them
# Well it doesn't say anywhere that it has to say things like, you have a 10 of Hearts. So, I think just initializing a singular array, that you pop/delete random values out of would work?

# Algo for intiializing the deck. I know how much I need it in so that's not a mystery.
# I just have to add 4 of each value
# Nested loop? Each loop in an array of all the values, with an inner loop that runs 4 times?

# OK, thinking about how to handle the aces check.
# Rules: Aces equal 11 if under 21, and 1 if over 21.
# ALgo
# Check hand to see if it includes ace,
# if so then call a funciton called ace_correction
# then do all conversion in that function - so ace is 11 but if the total thing is larger than 21, it's 1. That seems straight forward enough.
# So each time you hit, check the value of the hand, and within that check call ace_correction to it down into a singular value, and pass that back.





# It's a bit repetitive to use the same code under dealing the deck, and hitting. that can just be a method
# that deals a card, and you call it multiple times for the dealing of the deck
require 'pry'
require 'pry-byebug'

CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
END_MESSAGES = {
  dealer_bust: "The dealer went over 21. You win!",
  player_bust: "You went over 21. You lose!",
  player_wins: "You beat the dealer",
  dealer_wins: "The dealer wins.",
  tie: "It's a push."
}

def initialize_deck()
  CARD_VALUES.each_with_object([]) do |card, deck|
    4.times { |_| deck << card }
  end
end

def deal_cards(full_deck)
  card_hands = { player: [], dealer: []}
  card_hands.each do |person, hand|
    2.times do |_|
      card = full_deck.sample
      hand << card
      index = full_deck.find_index(card)
      full_deck.delete_at(index)
    end
  end

  card_hands
end

def ace_correction(hand, score)
  score.reject! { |card| card == 'Ace'}

  hand.each do |card|
    if card == 'Ace'
      if (score.sum + 11) > 21
        score << 1
      else
        score << 11
      end
    end
  end

  score
end

def calculate_hand(current_hands)
  scores = { player: [], dealer: []}
  current_hands.each do |player, hand|
    has_ace = true if hand.include?('Ace')

    hand.each do |card|
      if CARD_VALUES[-4, 3].include?(card)
          scores[player] << 10
      else
        scores[player] << card
      end
    end

    if has_ace == true
      scores[player] = ace_correction(hand, scores[player])
    end
    scores[player]
  end

  scores
end

def hit(hand, full_deck)
  card = full_deck.sample
  hand << card
  index = full_deck.find_index(card)
  full_deck.delete_at(index)
end


def display_hand(current_hands)
  puts "==> The dealer has #{current_hands[:dealer][0]} and an unknown card."
  puts "==> Your current hand is: #{current_hands[:player]}"
end

def over_twenty_one?(scores, person)
  scores[person].sum > 21
end



# Starts the game at zero
deck = initialize_deck
hands = deal_cards(deck)

# I'm initializing this here to use it inside the separate loops
current_scores = {}

busted = { player: false, dealer: false }

# Player loop
# Algo
# Display the hand
# Ask, do you want to hit or stay
# If stay, break out of the loop
# if hit, hit method, then loop

# Player loop
loop do
  display_hand(hands)
  current_scores = calculate_hand(hands)
  if over_twenty_one?(current_scores, :player)
    busted[:player] = true
    break
  end
  puts "Your current score is #{current_scores[:player].sum}"
  puts "Do you want to hit, or do you want to stay?"
  next_move = gets.chomp.downcase
  break if next_move.start_with?('s')
  hit(hands[:player], deck)
end

# Dealer loop
if !busted[:player]
  loop do
    if over_twenty_one?(current_scores, :dealer)
      busted[:dealer] = true
      break
    elsif current_scores[:dealer].sum >= 17
      break
    else
      hit(hands[:dealer], deck)
    end

    current_scores = calculate_hand(hands)
  end
end

# Comparison and display of the appropriate message
if busted[:player]
  puts END_MESSAGES[:player_bust]
elsif busted[:dealer]
  puts END_MESSAGES[:dealer_bust]
elsif current_scores[:player].sum == current_scores[:dealer].sum
  puts END_MESSAGES[:tie]
elsif current_scores[:player].sum > current_scores[:dealer].sum
  puts END_MESSAGES[:player_wins]
else
  puts END_MESSAGES[:dealer_wins]
end

p current_scores
p hands