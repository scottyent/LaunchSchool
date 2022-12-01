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
    new_board = Hash.new
    (1..9).each { |space_num| new_board[space_num] = Square.new }
    new_board
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |     "
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}"
    puts "     |     |     "
    puts "-----------------"
    puts "     |     |     "
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}"
    puts "     |     |     "
    puts "-----------------"
    puts "     |     |     "
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}"
    puts "     |     |     "
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def []=(space, marker)
    squares[space].marker = marker
  end

  def reset
    @squares = empty_board
  end

  # Should return an array of numbers representing the free spaces
  def unmarked_spaces
    squares.select { |_, square| square.unmarked? }.keys
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
      if winning_row?(line)
        choice = squares[line.first]
        return choice.marker if choice.marked?
      end
    end
    nil
  end

  # returns nil or a optimal space number to move to
  def find_optimal_space
    defense = nil
    offense = nil

    WINNING_LINES.each do |line|
      # Find an option for defense
      if marker_count(line, TTTGame::HUMAN_MARKER) == 2
        line.each do |space_num|
          defense = space_num if squares[space_num].unmarked?
        end
      end

      # Find an option for offense
      if marker_count(line, TTTGame::COMPUTER_MARKER) == 2
        line.each do |space_num|
          offense = space_num if squares[space_num].unmarked?
        end
      end
    end


    if squares[5].unmarked? && !defense && !offense
      offense = 5
    end

    offense || defense
  end

  private

  def row_string(line)
    row = line.map { |space_num| squares[space_num].marker }.join
    row.delete(Square::INITIAL_MARKER)
  end

  def marker_count(line, marker)
    string_row = row_string(line)
    string_row.count(marker)
  end

  def winning_row?(line)
    row = line.map { |space| squares[space].marker }
    row.count(row.first) == 3
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

  def self.human_pick_marker
    marker = nil
    loop do
      puts 'What symbol do you want? You can choose X, Y, or any letter!'
      marker = gets.chomp.upcase
      break if ("A".."Z").include?(marker)
      puts "I'm sorry that's not a valid choice"
    end
    marker
  end

  def self.computer_pick_marker
    return 'X' if TTTGame::HUMAN_MARKER == 'O'
    'O'
  end
end

# Orchestration Engine

class TTTGame
  HUMAN_MARKER = Player.human_pick_marker
  COMPUTER_MARKER = Player.computer_pick_marker
  TOURNAMENT_MAX = 5

  attr_reader :board, :human, :computer, :first_players_turn, :first_mover

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @first_players_turn = true
    @first_mover = nil
  end

  def play
    clear_screen
    display_welcome_message
    user_picks_first_mover
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

  def user_picks_first_mover
    pick = nil
    loop do
      puts "Who should go first? Computer/Player"
      pick = gets.chomp.downcase
      break if %w(computer player).include?(pick)
      puts "That's not a valid choice"
    end
    clear_screen

    @first_mover = pick.start_with?("c") ? @computer : @human
  end

  def tournament_over?
    @human.games_won == TOURNAMENT_MAX || @computer.games_won == TOURNAMENT_MAX
  end

  def player_move
    loop do
      current_player_moves
      clear_screen_and_display_board
      break if game_over?
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
    optimal_move = board.find_optimal_space
    choice = optimal_move || board.unmarked_spaces.sample
    board[choice] = computer.marker
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
    @first_players_turn = true
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
    case first_mover
    when @human
      first_players_turn ? human_moves : computer_moves
    when @computer
      first_players_turn ? computer_moves : human_moves
    end

    @first_players_turn = !first_players_turn
  end
end

game = TTTGame.new
game.play
