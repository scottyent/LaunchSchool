PLAYER = "X"
COMPUTER = "O"

puts "who goes first, computer or player"
goes_first = gets.chomp.downcase

def player_turn()
  puts "Player went #{PLAYER}"
end

def computer_turn()
  puts "Computer went #{COMPUTER}"
end

if goes_first.start_with?('c')
  PLAYER = "O"
  COMPUTER = "X"
  computer_turn
  player_turn
else
  player_turn
  computer_turn
end

