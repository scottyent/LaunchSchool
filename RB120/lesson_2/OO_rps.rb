# I'm going to attempt describing the gameplay myself before using their
# example. Rock paper scissor is a game where each player chooses either rock,
# paper, or scissor. The two choices are then compared using the game logic for
# what beats what, and then
# a winner is declared.

# Ok, I would say it's relatively similar to their description, they were just
# more explicit on the actual game logic:

# Rock, Paper, Scissors is a two-player game where each player chooses
# one of three possible moves: rock, paper, or scissors. The chosen moves
# will then be compared to see who wins, according to the following rules:

# - rock beats scissors
# - scissors beats paper
# - paper beats rock

# If the players chose the same move, then it's a tie.

# I'm going to try to extract the nouns myself without looking at the answer:
# player, computer, rock paper scissor?...
# Their answer:
# Nouns: player, move, rule
# Verbs: choose, compare

# - I have no idea how they got that. Move is a verb? but I guess it's a state
# describing what choice was made, so includes rock/paper/scissor. Rule?
# Idk what that means. Maybe the hardcoded state of what the rules are?

# Now we compare the nouns to the verbs and fit them where they belong:
# Player
#  - choose
# Move
# Rule

# - compare

# compare wasn't obvious where to go so they left it separate. Alright.
# Let's attempt to code the basics here.

require 'pry'
require 'pry-byebug'

module Dividable
  def divider
    divider = '-' * 25
    puts divider
  end
end

class Move
  include Comparable
  VALUES = %w(rock paper scissors spock lizard)
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_s
    value
  end

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
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
    (rock? && (other_player.scissors? || other_player.lizard?)) ||
      (paper? && (other_player.rock? || other_player.spock?)) ||
      (scissors? && (other_player.paper? || other_player.lizard?)) ||
      (spock? && (other_player.rock? || other_player.scissors?)) ||
      (lizard? && (other_player.spock? || other_player.paper?))
  end

  def <(other_player)
    (rock? && (other_player.paper? || other_player.spock?)) ||
      (paper? && (other_player.scissors? || other_player.lizard?)) ||
      (scissors? && (other_player.rock? || other_player.spock?)) ||
      (spock? && (other_player.lizard? || other_player.paper?)) ||
      (lizard? && (other_player.rock? || other_player.scissors?))
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

class GameHistory
  include Dividable
  attr_accessor :past_choices

  def initialize
    @past_choices = []
  end

  def add_round(round)
    @past_choices << round
  end

  def display
    current_round = 1
    puts "Past round choices:"
    @past_choices.each do |round|
      puts "Round #{current_round}: #{round}"
      current_round += 1
    end
    divider
  end

end

class RPSgame
  include Dividable
  attr_accessor :human, :computer, :history
  MAX_WINS = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = GameHistory.new
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      history.add_round(["#{human.name}: #{human.move}",
        "#{computer.name}: #{computer.move}"])
      display_moves
      display_winner
      display_scoreboard
      history.display
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
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_scoreboard
    divider
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
    divider
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
      winning_message = <<~MSG.chomp
      #{tournament_winner.name} has won the tournament!
      #{tournament_winner.name} won #{tournament_winner.score} games.
      MSG
      puts winning_message
    end
    puts "Thanks for playing! Goodbye."
  end
end

RPSgame.new.play

# Compare this design with the one in the previous assignment

# is this design, with Human and Computer sub-classes, better? Why, or why not?
# what is the primary improvement of this new design?
# what is the primary drawback of this new design?

# Answer - I think this new design is better, because it puts the logic for the
# particular player into a subclass where we know we're only talking about that
# type of player. Before, we were essentially creating 2 paths within Player,
# and now we have two distinct wrappers for each path that have their self
# contained logic and can easily be read/modified. Another benefit, is it makes
# it that much easier to generate new computer instances if you wanted to expand
# the game.

# The primary drawback of this design... in my opinion, is that it just adds a
# bit to the vertical complexity. Before, all logic was one in one player method
# and so you could focus there. With the player class being inherited you now
# have to consider how changes to that, will impact changes lower in the
# hierarchy, and be more strategic about this down the road in case you break
# something.

# Compare this design with the one in the previous assignment (this is the
# refactoring to include a Move class):

# what is the primary improvement of this new design? The logic of who wins or
# loses is simpler and easier to read in the main game engine. It also might be
# more maintainable down the road because you can just go to the comparison
# methods and tweak it if you need more options (like fire or whatever)

# what is the primary drawback of this new design? I think this was an awfully
# large amount of work to make that small piece of code a little bit clearer.
# When it was in one big chunk, you could read it over and work things out.
# Now, it's creating a move class with its own object we had to refactor to make
# that work, then created a ton of new methods within the move class and at
# the end of the day, we just abstracted the logic into two if statements in
# the < > methods. Is that better? I'm not too sure. It made one area easier
# to read, while making a huge other area harder to read in my opinion.
