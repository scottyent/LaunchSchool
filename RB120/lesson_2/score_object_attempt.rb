# I'm creating this file to attempt the exploratino of using a Score class
# would be better than just using the score attribute in Player
# I guess I could have used another branch in Git, but really I don't want
# to merge this likely, and so this can just be my scrap paper.

# Conclusion: After implementing it as a class, I still think implementing
# as an actual attribute of player is the better way. It's simpler, it results
# in less complicated calls to access the score, and last but not least, the
# score at the end of the day is an integer - we don't need any special
# comparison operators to make that more streamlined, it works inherently
# with integers so we basically just have an empty Score class that initializes
# an attribute with a slightly different name.


require 'pry'
require 'pry-byebug'

class Score
  include Comparable
  attr_accessor :count

  def initialize
    @count = 0
  end


end

class Move
  include Comparable
  VALUES = %w(rock paper scissors)
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_s
    value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_player)
    (rock? && other_player.scissors?) ||
      (paper? && other_player.rock?) ||
      (scissors? && other_player.paper?)
  end

  def <(other_player)
    (rock? && other_player.paper?) ||
      (paper? && other_player.scissors?) ||
      (scissors? && other_player.rock?)
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    @name = set_name
    @score = Score.new
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
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
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
    human.score.count == MAX_WINS || computer.score.count == MAX_WINS
  end

  def display_moves
    divider
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_scoreboard
    divider
    puts "#{human.name}: #{human.score.count}"
    puts "#{computer.name}: #{computer.score.count}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} wins!"
      human.score.count += 1
    elsif human.move < computer.move
      puts "#{computer.name} wins!"
      computer.score.count += 1
    else
      puts "It's a tie."
    end
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors #{human.name}!"
    divider
  end

  def tournament_winner
    return computer if computer.score.count > human.score.count
    return human if human.score.count > computer.score.count
  end


  def display_goodbye_message
    divider
    if tournament_winner
      winning_message = <<~MSG.chomp
      #{tournament_winner.name} has won the tournament!
      #{tournament_winner.name} won #{tournament_winner.score.count} games.
      MSG
      puts winning_message
    end
    puts "Thanks for playing! Goodbye."
  end

  def divider
    divider = '-' * 30
    puts divider
  end
end

RPSgame.new.play