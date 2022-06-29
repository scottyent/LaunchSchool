VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
    (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper')
    prompt("You won!\u{1F389}")
  elsif (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors') ||
          (player == 'scissors' && computer == 'rock')
    prompt("Computer won!")
  else
    prompt("Tie")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets().chomp()

    break if VALID_CHOICES.include?(choice.downcase)
    prompt("That's not a valid answer.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}, computer chose: #{computer_choice}")

  sleep(1)
  display_results(choice, computer_choice)

  prompt("Do you want to play again? (y/n)")
  play_again = gets().chomp()
  break unless play_again.downcase.start_with?('y')
end

prompt("Thanks for playing, goodbye!")
