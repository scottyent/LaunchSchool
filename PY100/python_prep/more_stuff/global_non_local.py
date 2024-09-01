# greeting = 'Salutations'

# def well_howdy(who):
#     greeting = 'Howdy'
#     print(f'{greeting}, {who}')

# well_howdy('Angie')
# print(greeting)

# greeting = 'Salutations'

# def well_howdy(who):
#     global greeting
#     greeting = 'Howdy'
#     print(f'{greeting}, {who}')

# well_howdy('Angie')
# print(greeting)

greeting = 'hi'

def say_hi():
    global greeting
    greeting = 'goodbye'

    def inner_function():
        print(greeting) # This will raise an error

    inner_function()

say_hi()