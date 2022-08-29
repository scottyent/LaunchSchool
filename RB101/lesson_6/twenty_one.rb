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

## Looks good
def initialize_deck
  CARD_VALUES.each_with_object([]) do |card, deck|
    4.times { |_| deck << card }
  end
end

## Looks good
def deal_cards(full_deck)
  card_hands = { player: [], dealer: [] }
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

## Looks good - slight concern on edge cases with multiple aces but I think it checks out
def ace_correction(hand, score)
  score.reject! { |card| card == 'Ace' }

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

## Looks good - modified to add a bang as it modifies the caller
def hit!(hand, full_deck)
  card = full_deck.sample
  hand << card
  index = full_deck.find_index(card)
  full_deck.delete_at(index)
end

# Ok, but not named specifically enough, or just is too niche. This is only the initial hands with a hidden dealer card.
def display_hand(current_hands)
  puts "==> The dealer has #{current_hands[:dealer][0]} and an unknown card."
  puts "==> Your current hand is: #{current_hands[:player]}"
end

## Looks good
def over_twenty_one?(scores, person)
  scores[person].sum > 21
end

def blackjack!(scores, blackjack)
  scores.each do |person, score|
    if scores[person].sum == 21
      blackjack[person] = true
    end
  end
end

def display_blackjack_winner(blackjack_record)
  if blackjack_record.values.count(true) == 2
    "It's a tie. Both players got blackjack."
  elsif blackjack_record[:player] == 21
    "Congrats! You got Blackjack!"
  else
    "You lose. THe dealer has Blackjack."
  end
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
    display_hand(hands)
    current_scores = calculate_hand(hands)
    if over_twenty_one?(current_scores, :player)
      busted[:player] = true
      break
    end
    puts "Your current score is #{current_scores[:player].sum}"
    puts "Do you want to hit, or do you want to stay?"
    next_move = gets.chomp.downcase
    system('clear')
    break if next_move.start_with?('s')
    hit!(hands[:player], deck)
    binding.pry
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
        hit!(hands[:dealer], deck)
      end

      current_scores = calculate_hand(hands)
    end
  end

end

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
