# Write a function that takes a short line of text and prints it within a box.

# Box characteristics
CORNER = '$'
SIDE = '|'
TOP_BOTTOM = '='

# Formatting
PADDING = 2
MAX_TEXT_LENGTH = 65

def print_blank_row(size):
    print(f'{SIDE}{' ' * size}{SIDE}')

def print_top_bottom(size):
    print(f'{CORNER}{TOP_BOTTOM * size}{CORNER}')

def process_text(long_text):
    if len(long_text) <= MAX_TEXT_LENGTH:
        return [[long_text]]

    chunked_text = []
    text_list = long_text.split()
    line = []

    for word in text_list:
        if len(word) + len(''.join(line)) < MAX_TEXT_LENGTH - len(word):
            line.append(word)
        else:
            chunked_text.append(line)
            line = []
            line.append(word)

    chunked_text.append(line)
    return chunked_text

def print_text_line(text, total_length):
    text = process_text(text)
    side_padding = PADDING // 2
    for line in text:
        full_line = ' '.join(line)
        remaining_space = total_length - side_padding - len(full_line)
        print(
            f'{SIDE}'
            f'{side_padding * ' '}'
            f'{full_line}'
            f'{remaining_space * ' '}'
            f'{SIDE}'
        )

def print_in_box(text):
    full_length = MAX_TEXT_LENGTH + PADDING if len(text) >= MAX_TEXT_LENGTH else len(text) + PADDING
    print_top_bottom(full_length)
    print_blank_row(full_length)
    print_text_line(text, full_length)
    print_blank_row(full_length)
    print_top_bottom(full_length)

# print_in_box('To boldly go where no one has gone before.')
# # +--------------------------------------------+
# # |                                            |
# # | To boldly go where no one has gone before. |
# # |                                            |
# # +--------------------------------------------+

# print_in_box('')
# # +--+
# # |  |
# # |  |
# # |  |
# # +--+

print_in_box('')
print_in_box('To boldly go where. no one has gone before.')
print_in_box('Supercalifragilisticexpialidocious is Supercalifragilisticexpialidocious')
print_in_box("Best of luck with the property search in Germany! That's an exciting project to focus your energy on while you continue to explore your interests in development and building things.")