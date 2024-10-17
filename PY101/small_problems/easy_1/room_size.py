# Build a program that asks the user to enter the length and width of a room,
# in meters, then prints the room's area in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

CONVERSION_FACTOR = {
    'feet': (1 / 10.7639),
    'meters': 10.7639,
}

def validate_unit(text):
    while text not in ['feet', 'meters']:
        print("That's not a valid input, please choose feet or meters")
        text = input()
    return text


print('Welcome to the square meters to square feet converter!')
length = float(input('What is the length of the room? '))
width = float(input('What is the width of the room? '))
squared = length * width

unit = validate_unit(input('Is this in feet or meters? '))

for measurement in CONVERSION_FACTOR.keys():
    if measurement != unit:
        target_unit = measurement

print(f'''Perfect, the room size is:
    {squared:.2f} square {unit}
    {squared * CONVERSION_FACTOR[unit]:.2f} square {target_unit}''')

# Further Exploration
# Modify the program to let the user specify the measurement type (meters or
# feet). Compute the area accordingly and print it and its conversion in
# parentheses.