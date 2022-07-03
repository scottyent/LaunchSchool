# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

p greeting

# I expect the error to be unknown local variable, because the path was never taken to set this variable
# I was incorrect - nothing happens, the variable is there but prints a nil value

# Learning here - if you initialize a variable inside any IF block, even if it doesn't get run, Ruby will initialize it to nil.