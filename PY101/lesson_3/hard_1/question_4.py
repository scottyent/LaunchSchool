# Ben was tasked to write a simple Python function to determine whether an input
# string is an IP address using 4 dot-separated numbers, e.g., 10.4.5.11.

# Alyssa supplied Ben with a function named is_an_ip_number. It determines
# whether a string is a numeric string between 0 and 255 as required for IP
# numbers and asked Ben to use it. Here's the code that Ben wrote:

def is_an_ip_number(s):
    try:
        # Convert string to an integer
        num = int(s)
        # Check if it's in the valid range for an IP number
        return 0 <= num <= 255
    except ValueError:
        # If the conversion to integer fails, it's not a valid number
        return False

def is_dot_separated_ip_address(input_string):
    dot_separated_words = input_string.split(".")
    if len(dot_separated_words) != 4:
        return False

    while len(dot_separated_words) > 0:
        word = dot_separated_words.pop()
        if (not is_an_ip_number(word)):
            return False

    return True

# Alyssa reviewed Ben's code and said, "It's a good start, but you missed a few
# things. You're not returning a false condition, and you're not handling the
# case when the input string has more or less than 4 components, e.g., 4.5.5
# or 1.2.3.4.5: both those values should be invalid."

# Help Ben fix his code.

print(is_dot_separated_ip_address('10.4.5.11')) # True
print(is_dot_separated_ip_address('4.5.5')) # False
print(is_dot_separated_ip_address('1.2.3.4.5')) # False
print(is_dot_separated_ip_address('192.158.1.38')) # True