# Without running the following code, what does it print? Why?

def bar_code_scanner(serial):
    match serial:
        case '123':
            print('Product1')
        case '113':
            print('Product2')
        case '142':
            print('Product3')
        case _:
            print('Product not found!')

bar_code_scanner('113')
bar_code_scanner(142)

# It will print first 'Product2' and then 'Product not found'. The reason for this
# is that the first time the function is called, it's passed in a string literal
# with the value 113. When it enters the match case to check for equality,
# it will find a match on the second case statement which has '113' as the value.
# However, for the second time that we call the function, we pass in an integer
# literal and not a string literal. Since the match statement only is using string
# literals to compare to, it will not find a match and use the default statement
# to print out that the product wasn't found.