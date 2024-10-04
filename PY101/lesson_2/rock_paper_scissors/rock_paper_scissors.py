import random

VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

BEATS = {
    'rock'    : ['scissors', 'lizard'],
    'paper'   : ['rock', 'spock'],
    'scissors': ['paper', 'lizard'],
    'spock'   : ['rock', 'scissors'],
    'lizard'  : ['paper', 'spock'],
}

def prompt(message):
    print(f'==>{message}')

def user_wins(player, computer):
    return computer in BEATS[player]

def computer_wins(player, computer):
    return player in BEATS[computer]

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
