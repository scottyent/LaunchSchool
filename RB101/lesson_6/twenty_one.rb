require 'pry'
require 'pry-byebug'

MAX_VALUE = 21
DEALER_MIN = 17

CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
END_MESSAGES = {
  dealer_bust: "The dealer went over #{MAX_VALUE}. You win!",
  player_bust: "You went over #{MAX_VALUE}. You lose!",
  player_wins: "You beat the dealer.",
  dealer_wins: "The dealer wins.",
  tie: "It's a push."
}

## Looks good
def initialize_deck
  CARD_VALUES.each_with_object([]) do |card, deck|
    4.times { |_| deck << card }
  end
end

## Looks good
def deal_cards(full_deck)
  card_hands = { player: [], dealer: [] }
  card_hands.each do |_, hand|
    2.times do |_|
      card = full_deck.sample
      hand << card
      index = full_deck.find_index(card)
      full_deck.delete_at(index)
    end
  end

  card_hands
end

## Looks good
def calculate_hand(current_hands)
  scores = { player: [], dealer: [] }
  current_hands.each do |player, hand|
    hand.each do |card|
      if CARD_VALUES[-4, 3].include?(card)
        scores[player] << 10
      else
        scores[player] << card
      end
    end

    if scores[player].include?('Ace')
      scores[player] = ace_correction(hand, scores[player])
    end

    scores[player]
  end

  scores
end

def ace_correction(hand, score)
  score.reject! { |card| card == 'Ace' }

  hand.each do |card|
    if card == 'Ace'
      (score.sum + 11) > MAX_VALUE ? score << 1 : score << 11
    end
  end

  score
end

## Looks good - modified to add a bang as it modifies the caller
def hit!(hand, full_deck)
  card = full_deck.sample
  hand << card
  index = full_deck.find_index(card)
  full_deck.delete_at(index)
end

def display_hands_to_player(current_hands, current_scores)
  puts "=> The dealer has #{current_hands[:dealer][0]} and an unknown card."
  puts "=> Your current hand is: #{current_hands[:player]} for a total of #{current_scores[:player].sum}"
end

## Looks good
def over_twenty_one?(scores, person)
  scores[person].sum > MAX_VALUE
end

def blackjack!(scores, blackjack)
  scores.each do |person, score|
    if score.sum == MAX_VALUE
      blackjack[person] = true
    end
  end
end

def display_blackjack_winner(blackjack_record)
  if blackjack_record.values.count(true) == 2
    "It's a tie. Both players got blackjack."
  elsif blackjack_record[:player] == true
    "Congrats! You got Blackjack!"
  else
    "You lose. The dealer has Blackjack."
  end
end

def display_final_hands(current_hands, scores)
  puts "==> The dealer has #{current_hands[:dealer]} for a total of #{scores[:dealer].sum}"
  puts "==> You have #{current_hands[:player]} for a total of #{scores[:player].sum}"
end

busted = { player: false, dealer: false }
blackjack = { player: false, dealer: false }

deck = initialize_deck
hands = deal_cards(deck)
current_scores = calculate_hand(hands)

# Checks for blackjack and adjusts boolean
blackjack!(current_scores, blackjack)

# Only starts the loops if there are no blackjacks
if blackjack.values.count(false) == 2

  # Player loop
  loop do
    current_scores = calculate_hand(hands)
    display_hands_to_player(hands, current_scores)
    if over_twenty_one?(current_scores, :player)
      busted[:player] = true
      break
    end
    puts "Do you want to hit, or do you want to stay?"
    next_move = gets.chomp.downcase
    system('clear')
    break if next_move.start_with?('s')
    hit!(hands[:player], deck)
  end

  # Dealer loop
  unless busted[:player]
    loop do
      if over_twenty_one?(current_scores, :dealer)
        busted[:dealer] = true
        break
      elsif current_scores[:dealer].sum >= DEALER_MIN
        break
      else
        hit!(hands[:dealer], deck)
      end

      current_scores = calculate_hand(hands)
    end
  end

end

display_final_hands(hands, current_scores)

# Comparison and display of the appropriate message
if blackjack.values.include?(true)
  puts display_blackjack_winner(blackjack)
elsif busted[:player]
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
