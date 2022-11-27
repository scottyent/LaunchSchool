require 'pry'
require 'pry-byebug'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_reader :squares

  def initialize
    @squares = empty_board
  end

  def empty_board
    arr = []
    9.times { |_| arr << Square.new }
    arr
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |     "
    puts "  #{squares[0]}  |  #{squares[1]}  |  #{squares[2]}"
    puts "     |     |     "
    puts "-----------------"
    puts "     |     |     "
    puts "  #{squares[3]}  |  #{squares[4]}  |  #{squares[5]}"
    puts "     |     |     "
    puts "-----------------"
    puts "     |     |     "
    puts "  #{squares[6]}  |  #{squares[7]}  |  #{squares[8]}"
    puts "     |     |     "
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def []=(space, marker)
    squares[space - 1].marker = marker
  end

  def reset
    @squares = empty_board
  end

  def unmarked_spaces
    open_spaces = []
    squares.each_with_index do |square, index|
      open_spaces << (index + 1) if square.unmarked?
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
      line_index = line.map { |space_num| space_num - 1 }
      if count_marker(line_index) == 3
        choice = squares[line_index.first]
        return choice.marker if choice.marked?
      end
    end
    nil
  end

  private

  def count_marker(line)
    row = line.map { |index| squares[index].marker }
    row.count(row.first)
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

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :games_won, :marker

  def initialize(marker)
    @marker = marker
    @games_won = 0
  end
end

# Orchestration Engine

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  TOURNAMENT_MAX = 5

  attr_reader :board, :human, :computer, :first_player

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @first_player = true
  end

  def play
    clear_screen
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      display_board
      player_move
      display_result
      break if tournament_over?
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def tournament_over?
    @human.games_won == TOURNAMENT_MAX || @computer.games_won == TOURNAMENT_MAX
  end


  def player_move
    loop do
      current_player_moves
      break if game_over?
      clear_screen_and_display_board if first_player
    end
  end

  def joinor(open_array, delimeter=', ', conjunction='or')
    open_count = open_array.size
    return open_array.first.to_s if open_count == 1

    # If instead of case to catch all sizes larger than 3 specifically
    if open_count == 2
      open_array.join(" #{conjunction} ")
    elsif open_count >= 3
      first = open_array[0..-2]
      first.join(delimeter) + "#{delimeter}#{conjunction} #{open_array.last}"
    end
  end

  def clear_screen
    system 'clear'
  end

  def display_welcome_message
    puts "Welcome to Tic, Tac Toe!"
    puts "First to win #{TOURNAMENT_MAX} games, wins the tournament."
    divider
  end

  def display_goodbye_message
    divider
    puts "Thanks for playing Tic Tac Toe! Goodbye."
  end

  def divider
    puts "-" * 38
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def display_board
    puts "You're the #{human.marker} and the computer is the #{computer.marker}"
    display_tournament_score
    puts
    board.draw
    puts
  end

  def human_moves
    puts "Choose a free square: (#{joinor(board.unmarked_spaces)})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_spaces.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    random_space = (board.unmarked_spaces).sample
    board[random_space] = computer.marker
  end

  def display_tournament_score
    puts "You: #{@human.games_won} | Computer: #{@computer.games_won}"
  end


  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when HUMAN_MARKER
      @human.games_won += 1
      puts "You won!"
    when COMPUTER_MARKER
      @computer.games_won += 1
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
    @first_player = true
    clear_screen
  end

  def display_play_again_message
    puts "Let's play again!"
    divider
  end

  def game_over?
    board.full? || board.winner?
  end

  def current_player_moves
    first_player ? human_moves : computer_moves
    @first_player = !first_player
  end
end

game = TTTGame.new
game.play


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
