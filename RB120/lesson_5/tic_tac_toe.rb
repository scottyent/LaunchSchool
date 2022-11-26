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

module AsciiMessages
  WELCOME = "Welcome to Tic, Tac Toe!"
end


class Board
  WINNING_LINES = [[1, 2 ,3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +   # columns
                [[1, 5, 9], [3, 5, 7]]                # diagonals

  attr_reader :squares

  def initialize
    @squares = empty_board
  end

  def empty_board
    arr = []
    9.times { |_| arr << Square.new }
    arr
  end

  def reset
    @squares = empty_board
  end

  def get_square_at(square_number)
    index = square_number - 1
    squares[index]
  end

  def set_square_at(square_number, marker)
    index = square_number - 1
    squares[index].marker = marker
  end

  def unmarked_spaces
    open_spaces = []
    squares.each_with_index do |square, index|
      open_spaces << index + 1 if square.unmarked?
    end
    open_spaces
  end

  def full?
    unmarked_spaces.empty?
  end

  def winner?
    !!winning_marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      line_index = line.map { |space_num| space_num - 1}

      if count_human_marker(line_index) == 3
        return TTTGame::HUMAN_MARKER
      elsif count_computer_marker(line_index) == 3
        return TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end

  def count_human_marker(line)
    row = line.map { |index| squares[index].marker }
    row.count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(line)
    row = line.map { |index| squares[index].marker }
    row.count(TTTGame::COMPUTER_MARKER)
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
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
  include AsciiMessages

  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  attr_reader :board, :human, :computer
  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def clear_screen
    system 'clear'
  end

  def display_welcome_message
    puts WELCOME
  end

  def display_goodbye_message
    divider
    puts "Thanks for playing Tic Tac Toe! Goodbye."
  end

  def divider
    puts "-" * 17
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end
  def display_board
    puts "You're the #{human.marker} and the computer is the #{computer.marker}"
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
    puts "Choose a free square: (#{board.unmarked_spaces.join(", ")})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_spaces.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at((board.unmarked_spaces).sample, computer.marker)
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when HUMAN_MARKER
      puts "You won!"
    when COMPUTER_MARKER
      puts "Computer won."
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? y/n"
      answer = gets.chomp.downcase
      break if %(y n).include? answer
      puts "I'm sorry that's not a valid choice"
    end

    answer == 'y'
  end

  def reset
    board.reset
    clear_screen
    puts "Let's play again!"
  end

  def play
    clear_screen
    display_welcome_message

    loop do
      display_board

      loop do
        human_moves
        break if board.full? || board.winner?

        computer_moves
        break if board.full? || board.winner?

        clear_screen_and_display_board
      end
      display_result
      break unless play_again?
      reset
    end

    display_goodbye_message
  end
end

game = TTTGame.new
game.play


