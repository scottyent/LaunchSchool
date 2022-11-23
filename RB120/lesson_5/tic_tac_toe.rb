=begin
My own short description of the game:
starting with an empty 3x3 board, the first player chooses where to put an x.
The second player then decides where to put an O, and they alternate turns
until either a tie, or one player has 3 in a row of their marker.

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

require 'pry'
require 'pry-byebug'

class Board
  INITIAL_MARKER = " "
  attr_reader :squares
  def initialize
    @squares = empty_board
  end

  def empty_board
    arr = []
    9.times { |_| arr << Square.new(INITIAL_MARKER) }
    arr
  end

  def get_square_at(square_number)
    index = square_number - 1
    squares[index]
  end

  def set_square_at(square_number, marker)
    index = square_number - 1
    squares[index].marker = marker
  end
end

class Square
  attr_writer :marker

  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
  end

  def update(input_marker)
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

# Orchestration Engine

class TTTGame
  attr_reader :board, :human, :computer
  def initialize
    @board = Board.new
    @human = Player.new("X")
    @computer = Player.new("O")
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    divider
  end

  def display_goodbye_message
    divider
    puts "Thanks for playing Tic Tac Toe! Goodbye."
  end

  def divider
    puts "-" * 17
  end

  def display_board(board)
    puts
    puts "     |     |     "
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.
      get_square_at(3)}"
    puts "     |     |     "
    puts "-----------------"
    puts "     |     |     "
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.
      get_square_at(6)}"
    puts "     |     |     "
    puts "-----------------"
    puts "     |     |     "
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.
      get_square_at(9)}"
    puts "     |     |     "
    puts
  end

  def human_moves
    puts "Choose a square between 1-9"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if (1..9).include?(square)
      puts "Sorry, that's not a valid choice."
    end

    # binding.pry
    board.set_square_at(square, human.marker)
  end

  def play
    # loop do
      display_welcome_message
      loop do
        display_board(board)
        human_moves
        # break if winner? || board_full
        # computer_moves
        # break if winner? || board_full
      end
      # display_result
    #   break unless play_again?
    # end
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
