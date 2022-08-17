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

require 'pry'
require 'pry-byebug'

CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def initialize_deck()
  CARD_VALUES.each_with_object([]) do |card, deck|
    4.times { |_| deck << card }
  end
end

def deal_cards(full_deck)
  card_hands = { player: [], dealer: []}
  card_hands.each do |person, hand|
    2.times { |_| hand << CARD_VALUES.sample }
  end

  card_hands
end

def ace_correction(hand, score)
  ace_count = score.count('Ace')
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


    scores[player] = scores[player].sum
  end

  scores
end


deck = initialize_deck
hands = deal_cards(deck)
p hands
p calculate_hand(hands)

