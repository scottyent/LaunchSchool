# Description of the game in my own words:
# Tic Tac Toe is a game that we will create with one player and a computer player. The point of the game is to get
# Three of your symbols in a row within a 3 x 3 grid
# Players alternate turns until one is able to have 3 in a row, or there are no more playable moves

# Super similar to their description:
# Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn and
# marks a square on the board. First player to reach 3 squares in a row, including diagonals,
# wins. If all 9 squares are marked and no player has 3 squares in a row, then the game is a tie.

# Breaking it down to build a flow chart
# Display the board
# Allow first user to make a choice
# Place that users symbol in that space
# Did that player win? Is there a tie?
# If not, next player gets to make a choice and place their symbol
# Did that player win? Is there a tie?
# Next player. etc

# Their version, a bit more elegantly outlined:
# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!
require 'pry'
require 'pry-byebug'

def display_board(board_state)
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

def initialize_board()
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

board = initialize_board
display_board(board)