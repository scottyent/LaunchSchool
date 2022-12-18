# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

require 'pry'
require 'pry-byebug'

class Player
  attr_reader :name
  attr_accessor :attempts, :guess

  MAX_ATTEMPTS = 7

  def initialize
    @name = ask_name
    @guess = nil
    @attempts = MAX_ATTEMPTS
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

  def ask_for_guess
    user_guess = nil
    loop do
      puts "Enter a number between 1 and 100:"
      user_guess = gets.chomp
      break if GuessingGame::GUESSING_RANGE.cover?(user_guess.to_i)
      puts "Invalid guess."
    end

    self.attempts -= 1
    self.guess = user_guess.to_i
  end
end

class GuessingGame
  attr_reader :player
  attr_accessor :number

  GUESSING_RANGE = (1..100)

  def initialize
    @number = GUESSING_RANGE.to_a.sample
    @player = Player.new
  end

  def play
    until correct_guess? || player.attempts == 0
      clear_screen
      display_guess_count
      player.ask_for_guess
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
    player.attempts = Player::MAX_ATTEMPTS
    self.number = GUESSING_RANGE.to_a.sample
  end

  def clear_screen
    system 'clear'
  end

  def correct_guess?
    player.guess == number
  end
end

game = GuessingGame.new
game.play
game.play

