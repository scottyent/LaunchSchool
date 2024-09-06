# Building on your solutions from the previous exercises, write a function
# local_greet that takes a locale as input, and returns a greeting. The locale
# lets us greet people from different countries appropriately, even when they
# share a common language, for example:

def greet(language, region, multi_region):
    greetings = {
        'en': {'US': 'Hey!', 'AU':'Gooday!', 'GB': 'ello govna!'},
        'fr': 'Salut!',
        'pt': 'Olá!',
        'de': 'Hallo!',
        'sv': 'Hej!',
        'af': 'Haai!',
    }
    if multi_region:
        greeting_options = greetings.get(language)
        return greeting_options.get(region, "That region doesn't exist!")
    else:
        return greetings.get(language, "Whoops, don't have that language!")


def is_multi_region(language):
    multiple_greetings_languages = ['en']
    return language in multiple_greetings

def extract_language(locale):
    return locale[:2]

def extract_region(locale):
    return locale[3:5]

def local_greet(locale):
    language = extract_language(locale)
    region = extract_region(locale)
    multi_region = is_multi_region(language)
    return (greet(language, region, multi_region))



# Distinguish greetings for English speaking countries like the US, UK, Canada,
# or Australia in your implementation, and feel free to fall back on the
# language-specific greetings in all other cases, for example:

# When implementing local_greet, make sure you re-use your extract_language,
# extract_region, and greet functions from the previous exercises.

# Test Cases

print(local_greet('fr_FR.UTF-8'))       # Salut!
print(local_greet('fr_CA.UTF-8'))       # Salut!
print(local_greet('fr_MA.UTF-8'))       # Salut!

print(local_greet('en_US.UTF-8'))       # Hey!
print(local_greet('en_GB.UTF-8'))       # Hello!
print(local_greet('en_AU.UTF-8'))       # Howdy!

print(local_greet('en_QT.UTF-8'))       # That region doesn't exist!
print(local_greet('fw_US.UTF-8'))       # Whoops, don't have that language!