# Can you write some code to change the value 'bye' in the following
# tuple to 'goodbye'?

stuff = ('hello', 'world', 'bye', 'now')

list_stuff = list(stuff)
list_stuff[2] = 'goodbye'
stuff = tuple(list_stuff)

print(stuff)