# Create a function that takes 2 arguments, a list and a dictionary. The list will contain 2 or more elements that, when joined with spaces, will produce a person's name. The dictionary will contain two keys, "title" and "occupation", and the appropriate values. Your function should return a greeting that uses the person's full name, and mentions the person's title.

def greetings(name_list, info_dict):
    full_name = ' '.join(name_list)
    title = info_dict.get('title')
    job = info_dict.get('occupation')

    return f'Hello, {full_name}! Nice to have a {title} {job} around.'

greeting = greetings(
    ["John", "Q", "Doe"],
    {"title": "Master", "occupation": "Plumber"},
)
print(greeting)
# Hello, John Q Doe! Nice to have a Master Plumber around.