# Altering my solution to accept range parameters (low and high) for the game
# as well as appropriate amount of guesses so the user can always win

require 'pry'
require 'pry-byebug'

class Player
  attr_reader :name
  attr_accessor :attempts, :guess

  def initialize
    @name = ask_name
    @guess = nil
    @attempts = nil
  end

  def set_attempts(range)
    self.attempts = Math.log2(range.size).to_i + 1
  end

  def ask_name
    response = nil
    loop do
      puts "What's your name?"
      response = gets.chomp.capitalize
      break unless response.empty?
      puts "You have to input a name!"
    end

    response
  end

  def ask_for_guess(range)
    user_guess = nil
    loop do
      puts "Enter a number between #{range.first} and #{range.last}:"
      user_guess = gets.chomp
      break if range.cover?(user_guess.to_i)
      puts "Invalid guess."
    end

    self.attempts -= 1
    self.guess = user_guess.to_i
  end
end

class GuessingGame
  attr_reader :player, :range
  attr_accessor :number

  def initialize(low, high)
    @range = (low..high)
    @number = range.to_a.sample
    @player = Player.new
  end

  def play
    player.set_attempts(range)

    until correct_guess? || player.attempts == 0
      clear_screen
      display_guess_count
      player.ask_for_guess(range)
      display_hint
      sleep 1
    end

    display_results
    sleep 2
    reset_game
  end

  def display_hint
    return if correct_guess?
    position =  player.guess > number ? "high" : "low"
    puts "Your guess is too #{position}."
  end

  def display_results
    if correct_guess?
      puts "That's the number!"
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
      puts "The number was #{number}."
    end
  end

  def display_guess_count
    if player.attempts == 1
      puts "#{player.name}, you have #{player.attempts} guess remaining."
    else
      puts "#{player.name}, you have #{player.attempts} guesses remaining."
    end
  end

  def reset_game
    player.attempts = player.set_attempts(range)
    self.number = range.to_a.sample
  end

  def clear_screen
    system 'clear'
  end

  def correct_guess?
    player.guess == number
  end
end

game = GuessingGame.new(1, 1500)
game.play
game.play