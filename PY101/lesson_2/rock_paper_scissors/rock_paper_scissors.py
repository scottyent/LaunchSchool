import random

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message):
    print(f'==>{message}')

def user_wins(player, computer):
    return ((player == 'rock' and computer == 'scissors') or
        (player == 'paper' and computer == 'rock') or
        (player == ' scissors' and computer == 'paper'))

def computer_wins(player, computer):
    return ((player == 'rock' and computer == 'paper') or
        (player == 'paper' and computer == 'scissors') or
        (player == 'scissors' and computer == 'rock'))

def display_winner(player, computer):
    if user_wins(player, computer):
        prompt('You win!')
    elif computer_wins(player, computer):
        prompt('Computer wins.')
    else:
        prompt('It\'s a tie!')

prompt(f'Welcome to the {', '.join(VALID_CHOICES)} game!')

while True:
    prompt(f'Choose one: {', '.join(VALID_CHOICES)}')
    choice = input().casefold()

    while choice not in VALID_CHOICES:
        prompt(f'Please choose from {', '.join(VALID_CHOICES)}')
        choice = input()

    computer_choice = random.choice(VALID_CHOICES)
    prompt(f'Your pick: {choice} |  Computer pick: {computer_choice}')

    display_winner(choice, computer_choice)

    prompt('Do you want to play again? y/n')
    play_again = input().casefold()

    while True:
        if play_again.startswith('n') or play_again.startswith('y'):
            break
        prompt('Pick either "y" or "n"')
        play_again = input().casefold()

    if play_again[0] == 'n':
        break
