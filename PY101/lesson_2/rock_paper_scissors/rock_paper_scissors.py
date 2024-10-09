import random
import os
from time import sleep

VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']
TOTAL_GAMES = 5
GAMES_NEEDED_TO_WIN = (TOTAL_GAMES//2) + 1

BEATS = {
    'rock'    : ['scissors', 'lizard'],
    'paper'   : ['rock', 'spock'],
    'scissors': ['paper', 'lizard'],
    'spock'   : ['rock', 'scissors'],
    'lizard'  : ['paper', 'spock'],
}

def prompt(message):
    print(f'==> {message}')

def display_separator():
    print('---------------')

def clear_screen(time):
    sleep(time)
    os.system('clear')

def user_wins(player, computer):
    return computer in BEATS[player]

def computer_wins(player, computer):
    return player in BEATS[computer]

def update_scoreboard(player, computer, current_scoreboard):
    if user_wins(player, computer):
        current_scoreboard['Player'] += 1
    elif computer_wins(player, computer):
        current_scoreboard['Computer'] += 1

def display_scoreboard(current_scoreboard):
    prompt('Scoreboard')
    display_separator()
    for player, score in current_scoreboard.items():
        prompt(f'{player}: {score}')
    display_separator()

def display_winner(player, computer):
    prompt(f'Your pick: {player} |  Computer pick: {computer}')
    sleep(1)

    if user_wins(player, computer):
        prompt('You win!')
    elif computer_wins(player, computer):
        prompt('Computer wins.')
    else:
        prompt('It\'s a tie!')

def display_champion(current_scoreboard):
    display_separator()
    prompt('Game over!')
    display_scoreboard(current_scoreboard)

    player_score = current_scoreboard['Player']
    computer_score = current_scoreboard['Computer']

    sleep(1)
    if player_score == GAMES_NEEDED_TO_WIN:
        prompt(f'You won {GAMES_NEEDED_TO_WIN} games '
                   'and are the champion! \U0001F389')
    elif computer_score == GAMES_NEEDED_TO_WIN:
        prompt(f'The computer won {GAMES_NEEDED_TO_WIN} games '
                   'and is the champion! \U0001F389')

def ask_spock_or_scissors():
    prompt('You only entered one s. Did you mean Spock or Scissors?')
    answer = input().casefold()

    while not (answer.startswith('sp') or answer.startswith('sc')):
        prompt("I'm sorry, that's not a valid choice")
        answer = input().casefold()

    return answer

def match_choice(player_choice):
    # Handle empty strings
    if not player_choice:
        return player_choice

    # Handle single character s choice
    if player_choice == 's':
        player_choice = ask_spock_or_scissors()

    for move in VALID_CHOICES:
        if move.startswith(player_choice):
            return move

    return None

def welcome_to_game():
    display_separator()
    prompt(f'Welcome to the {', '.join(VALID_CHOICES)} game!')
    prompt(f'If you choose to continue playing, the first to win'
        f' {GAMES_NEEDED_TO_WIN} games wins the championship.')
    prompt('Good luck!')
    display_separator()
    clear_screen(4)

def play_again_choice():
    prompt('Do you want to play again? y/n')
    play_again = input().casefold()

    while True:
        if play_again != '':
            if play_again in 'yes' or play_again in 'no':
                break
        prompt('Pick either "y" or "n"')
        play_again = input().casefold()

    return play_again

def player_chooses_move():
    clear_screen(1)
    prompt(f'Choose one: {', '.join(VALID_CHOICES)}')

    answer = match_choice(input().casefold())

    while answer not in VALID_CHOICES:
        prompt(f'Please choose from {', '.join(VALID_CHOICES)}')
        answer = match_choice(input().casefold())

    return answer

def computer_chooses_move():
    return random.choice(VALID_CHOICES)

def play_game():
    scoreboard = {
        'Player'  : 0,
        'Computer': 0,
    }

    welcome_to_game()

    while True:
        choice = player_chooses_move()
        computer_choice = computer_chooses_move()

        display_winner(choice, computer_choice)
        update_scoreboard(choice, computer_choice, scoreboard)
        clear_screen(2)

        if GAMES_NEEDED_TO_WIN in scoreboard.values():
            break

        display_scoreboard(scoreboard)

        continue_playing = play_again_choice()

        if 'n' in continue_playing:
            break

    display_champion(scoreboard)

play_game()
