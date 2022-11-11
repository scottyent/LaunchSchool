# I'm going to attempt describing the gameplay myself before using their example.
# Rock paper scissor is a game where each player chooses either rock, paper, or scissor.
# The two choices are then compared using the game logic for what beats what, and then
# a winner is declared.

# Ok, I would say it's relatively similar to their description, they were just more
# explicit on the actual game logic:

# Rock, Paper, Scissors is a two-player game where each player chooses
# one of three possible moves: rock, paper, or scissors. The chosen moves
# will then be compared to see who wins, according to the following rules:

# - rock beats scissors
# - scissors beats paper
# - paper beats rock

# If the players chose the same move, then it's a tie.

# Again, I'm going to try to extract the nouns myself without looking at the answer:
# player, computer, rock paper scissor?...
# Their answer:
# Nouns: player, move, rule
# Verbs: choose, compare

# - I have no idea how they got that. Move is a verb? but I guess it's a state describing
# what choice was made, so includes rock/paper/scissor. Rule? Idk what that means. Maybe the
# hardcoded state of what the rules are?

# Now we compare the nouns to the verbs and fit them where they belong:
# Player
#  - choose
# Move
# Rule

# - compare

# compare wasn't obvious where to go so they left it separate. Alright. Let's attempt
# to code the basics here.

require 'pry'
require 'pry-byebug'

class Player
  attr_reader :player_type
  attr_accessor :move, :name
  def initialize(player_type = 'human')
    @player_type = player_type
    @move = nil
    @name = set_name
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp
        break if ["rock", "paper", "scissors"].include?(choice)
        puts "Invalid choice."
      end
      self.move = choice
    else
      self.move = ["rock", "paper", "scissors"].sample
    end
  end

  def human?
    player_type == 'human'
  end

  private
  def set_name
    if human?
      puts "What's your name?"
      gets.chomp
    else
      %w(Ultron Dominator Hal Chappie R2D2).sample
    end
  end
end

class Move
  def initialize
    # choice? like whether it's rock paper scissor
  end
end

class Rule
  def initialize
    # ?
  end
end

# not sure where compare goes yet
def compare(move1, move2)

end

# We need an orchestration engine - whatttt? This is interesting :D
# Basically a class to... run the game flow? Kind of like, the outer logic
# in the procedural flow we've been doing

class RPSgame
  attr_accessor :human, :computer
  def initialize
    @human = Player.new
    @computer = Player.new('computer')
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_winner
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
  def display_winner
    divider
    puts "You chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} wins!"    if computer.move == 'scissors'
      puts "#{computer.name} wins."   if computer.move == 'paper'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} wins!" if computer.move == 'rock'
      puts "#{computer.name} wins." if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name} wins!" if computer.move == 'paper'
      puts "#{computer.name} wins." if computer.move == 'rock'
    end
  end

  def display_welcome_message
    puts "Welcome to Rock Paper Scissors!"
    divider
  end

  def display_goodbye_message
    divider
    puts "Thanks for playing! Goodbye."
  end

  def divider
    puts "#{'-' * 30}"
  end
end

RPSgame.new.play