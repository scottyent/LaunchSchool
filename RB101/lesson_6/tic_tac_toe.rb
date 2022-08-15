# Description of the game in my own words:
# Tic Tac Toe is a game that we will create with one player
# and a computer player. The point of the game is to get
# Three of your symbols in a row within a 3 x 3 grid
# Players alternate turns until one is able to have 3 in a row,
# or there are no more playable moves

# Super similar to their description:
# Tic Tac Toe is a 2 player game played on a 3x3 board.
# Each player takes a turn and
# marks a square on the board. First player to reach 3
# squares in a row, including diagonals,
# wins. If all 9 squares are marked and no player has 3
# squares in a row, then the game is a tie.

# Breaking it down to build a flow chart
# Display the board
# Allow first user to make a choice
# Place that users symbol in that space
# Did that player win? Is there a tie?
# If not, next player gets to make a choice and place their symbol
# Did that player win? Is there a tie?
# Next player. etc

# Their version, a bit more elegantly outlined:
# 1. Display the initial empty 3x3 board. :DONE
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

# Additional Assignments:
# write a joinor function that allows you to insert an or/and
# at the end of the list of joined available squares
require 'pry'
require 'pry-byebug'


# Player/Computer Marker Constants assigned in main game play body
DEFAULT_SPACE_VALUE = " "
WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                     [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                     [[1, 5, 9], [3, 5, 7]] # Diagonals

def prompt(message)
  puts "=> #{message}"
end

# rubocop:disable Metrics/AbcSize
def display_board(board_state)
  system 'clear'
  puts ""
  puts "     |     |"
  puts "  #{board_state[1]}  |  #{board_state[2]}  |  #{board_state[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board_state[4]}  |  #{board_state[5]}  |  #{board_state[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board_state[7]}  |  #{board_state[8]}  |  #{board_state[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = DEFAULT_SPACE_VALUE }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == DEFAULT_SPACE_VALUE }
end

def joinor(choices_array, delineator = ", ", end_word = "or")
  case choices_array.size
  when 1
    choices_array[0].to_s
  when 2
    "#{choices_array[0]} #{end_word} #{choices_array[1]}"
  else
    choices_array[-1] = "#{end_word} #{choices_array.last}"
    choices_array.join(delineator)
  end
end

def player_turn!(board)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(board))}):"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Either that spot is taken, or your entry is invalid."
  end

  board[square] = PLAYER_MARKER
end

def computer_turn!(board)
  optimal_move = find_optimal_move(board)
  computer_square = optimal_move ? optimal_move : empty_squares(board).sample

  board[computer_square] = COMPUTER_MARKER
end

def find_optimal_move(board)
  optimal_move = false

  defense = find_defensive_move(board)
  offense = find_offensive_move(board)

  if offense
    optimal_move = offense
  elsif defense
    optimal_move = defense
  elsif board[5] == DEFAULT_SPACE_VALUE
    optimal_move = 5
  end

  optimal_move
end

def find_defensive_move(board)
  defensive_move = false

  WINNING_CONDITIONS.each do |line_array|
    line_state = []
    line_array.each { |square_number| line_state << board[square_number] }
    check_line = line_state.join.gsub(DEFAULT_SPACE_VALUE, "")
    if check_line == "#{PLAYER_MARKER * 2}"
      defensive_move = line_array[line_state.find_index(DEFAULT_SPACE_VALUE)]
    end
  end

  defensive_move
end

def find_offensive_move(board)
  offensive_move = false

  WINNING_CONDITIONS.each do |line_array|
    line_state = []
    line_array.each { |square_number| line_state << board[square_number] }
    check_line = line_state.join.gsub(DEFAULT_SPACE_VALUE, "")
    if check_line == "#{COMPUTER_MARKER * 2}"
      offensive_move = line_array[line_state.find_index(DEFAULT_SPACE_VALUE)]
    end
  end

  offensive_move
end

def board_full?(board)
  empty_squares(board).empty?
end

def detect_winner(board)
  WINNING_CONDITIONS.each do |line_array|
    line_state = []
    line_array.each { |square_number| line_state << board[square_number] }

    case line_state
    when [PLAYER_MARKER, PLAYER_MARKER, PLAYER_MARKER]
      return "Player"
    when [COMPUTER_MARKER, COMPUTER_MARKER , COMPUTER_MARKER]
      return "Computer"
    end
  end

  false
end

def someone_won?(board)
  !!detect_winner(board)
end

def display_games_score(scoreboard)
  prompt "Computer: #{scoreboard[:computer]}"
  prompt "Player: #{scoreboard[:player]}"
end

def update_games_score(winner, scores)
  scores[winner] += 1
end

def who_goes_first()
  puts "Who should go first? Computer, Player, or Random?"
  order = gets.chomp.downcase
  if order.start_with?('r')
    order = (['computer', 'player']).sample
  end

  order
end

overall_scoreboard = { player: 0, computer: 0 }

first_player = who_goes_first

loop do
  board = initialize_board

  display_board(board)
  loop do
    display_board(board)

    if first_player.start_with?('c')
      PLAYER_MARKER = "O"
      COMPUTER_MARKER = "X"
      computer_turn!(board)
      break if someone_won?(board) || board_full?(board)
      display_board(board)

      player_turn!(board)
      break if someone_won?(board) || board_full?(board)
    else
      PLAYER = "X"
      COMPUTER = "O"
      player_turn!(board)
      break if someone_won?(board) || board_full?(board)

      computer_turn!(board)
      break if someone_won?(board) || board_full?(board)
    end
  end

  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    update_games_score(winner.downcase.to_sym, overall_scoreboard)
    prompt "#{winner} won!"
  else
    prompt "It's a tie."
  end

  game_over = true if overall_scoreboard.values.include?(5)

  if !game_over
    display_games_score(overall_scoreboard)
    prompt "Do you want to play again? (y/n)"
    answer = gets.chomp.downcase
    break if answer.start_with?('n')
  else
    prompt "#{winner} is the first to 5 games and wins the championship!"
    break
  end
end

puts "----------------------"
prompt "Thanks for playing!"
prompt "Final score: "
display_games_score(overall_scoreboard)
