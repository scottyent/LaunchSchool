def outer():
    outer_var = 'Hello'

    def inner():
        inner_var = 'World'
        print(outer_var, inner_var)

    inner()

outer()

# This will output 'Hello World' because the inner functino is able to access
# the `outer_var` variable because it's defined in the scope above it. Since
# `inner_var` is being defined within the inner() function, that is also
# accessible, so it will successfully output using both variables.