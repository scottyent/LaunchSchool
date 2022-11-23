=begin
My own short description of the game:
starting with an empty 3x3 board, the first player chooses where to put an x.
The second player then decides where to put an O, and they alternate turns
until either a tie, or one player has 3 in a row of their symbol.

Their description (somehwat similar but maybe a bit more succinct):
Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns
marking a square. The first player to mark 3 squares in a row wins.

Nouns:
Player
Board
Square
Grid

Verbs:
play
mark

Cleaned up:
Board
Square
Player
- play
- mark

=end

# Spike

class Board
  def initialize
    # Perhaps initializing an enpty board 3x3
    # A data structure to keep track of those difference areas of the board
    # array/hash of string objects?
    # array/hash of Square objects?
  end

  def display
  end
end

class Square
  def initialize
    # This one I' not sure about. Maybe square state, set to blank space?
  end

  def update(input_marker)
  end
end

class Player
  def initialize
  # Maybe their choices
  # the symbol assigned to them
  end

  def mark
  end
end

# Orchestration Engine

class TTTGame
  def play
    loop do
      display_welcome_message
      loop do
        display_board
        player1.mark
        break if winner? || board_full
        player2.mark
        break if winner? || board_full
      end
      display_result
      break unless play_again?
    end
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
