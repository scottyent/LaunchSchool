# A copy of the game to play with the suggestion to make all moves a class
# unto themsleves.

require 'pry'
require 'pry-byebug'

class Rock
  attr_reader :option, :beat, :loseto

  def initialize
    @option = 'rock'
    @beat = %w(scissors lizard)
    @loseto = %w(paper spock)
  end

  def to_s
    @option
  end
end

class Paper
  attr_reader :option, :beat, :loseto

  def initialize
    @option = 'paper'
    @beat = %w(rock spock)
    @loseto = %w(lizard scissors)
  end

  def to_s
    @option
  end
end

class Scissors
  attr_reader :option, :beat, :loseto

  def initialize
    @option = 'scissors'
    @beat = %w(paper lizard)
    @loseto = %w(rock spock)
  end

  def to_s
    @option
  end
end

class Spock
  attr_reader :option, :beat, :loseto

  def initialize
    @option = 'spock'
    @beat = %w(scissors rock)
    @loseto = %w(paper lizard)
  end

  def to_s
    @option
  end
end

class Lizard
  attr_reader :option, :beat, :loseto

  def initialize
    @option = 'lizard'
    @beat = %w(spock paper)
    @loseto = %w(rock scissors)
  end

  def to_s
    @option
  end
end

class Move
  include Comparable
  VALUES = [Rock.new, Paper.new, Scissors.new, Spock.new, Lizard.new]
  attr_reader :value

  def initialize(value)
    @value = value_to_object(value)
  end

  def value_to_object(input)
    case input
    when 'rock' then Rock.new
    when 'paper' then Paper.new
    when 'scissors' then Scissors.new
    when 'spock' then Spock.new
    when 'lizard' then Lizard.new
    else
      input
    end
  end
  def to_s
    value
  end

  def spock?
    @value.option == 'spock'
  end

  def lizard?
    @value.option == 'lizard'
  end

  def scissors?
    @value.option == 'scissors'
  end

  def rock?
    @value.option == 'rock'
  end

  def paper?
    @value.option == 'paper'
  end

  def >(other_player)
    # binding.pry
    (rock? && value.beat.include?(other_player.value.option)) ||
      (paper? && value.beat.include?(other_player.value.option)) ||
      (scissors? && value.beat.include?(other_player.value.option)) ||
      (spock? && value.beat.include?(other_player.value.option)) ||
      (lizard? && value.beat.include?(other_player.value.option))
  end

  def <(other_player)
    (rock? && value.loseto.include?(other_player.value.option)) ||
      (paper? && value.loseto.include?(other_player.value.option)) ||
      (scissors? && value.loseto.include?(other_player.value.option)) ||
      (spock? && value.loseto.include?(other_player.value.option)) ||
      (lizard? && value.loseto.include?(other_player.value.option))
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    @name = set_name
    @score = 0
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "That's not a valid name."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, spock, or lizard:"
      choice = gets.chomp
      break if Move::VALUES.map { |obj| obj.to_s }.include?(choice)
      puts "Invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = %w(Ultron Dominator Hal Chappie R2D2).sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# We need an orchestration engine - whatttt? This is interesting :D
# Basically a class to... run the game flow? Kind of like, the outer logic
# in the procedural flow we've been doing

class RPSgame
  attr_accessor :human, :computer
  MAX_WINS = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      display_scoreboard
      break if final_winner?
      break unless play_again?
    end
    display_goodbye_message
  end

  def play_again?
    loop do
      puts "Do you want to play again?(y/n)"
      choice = gets.chomp.downcase
      return true if %w(y yes).include?(choice)
      return false if %w(n no).include?(choice)
      puts "I'm sorry, that's not a valid choice."
    end
  end

  def final_winner?
    human.score == MAX_WINS || computer.score == MAX_WINS
  end

  def display_moves
    divider
    puts "#{human.name} chose #{human.move.value}"
    puts "#{computer.name} chose #{computer.move.value}"
  end

  def display_scoreboard
    divider
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} wins!"
      human.score += 1
    elsif human.move < computer.move
      puts "#{computer.name} wins!"
      computer.score += 1
    else
      puts "It's a tie."
    end
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors #{human.name}!"
    divider
  end

  def tournament_winner
    return computer if computer.score > human.score
    return human if human.score > computer.score
  end


  def display_goodbye_message
    divider
    if tournament_winner
      puts "#{tournament_winner.name} has won the tournament with #{tournament_winner.score} games."
    end
    puts "Thanks for playing! Goodbye."
  end

  def divider
    divider = '-' * 30
    puts divider
  end
end

RPSgame.new.play
