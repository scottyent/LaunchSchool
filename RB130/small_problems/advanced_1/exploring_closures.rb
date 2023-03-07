# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# Notes - created with a block, and block parameter that can be used
# later by only passing in that block parameter.
# Can still be called without the block parameter, doesn't give an error
# lenient arity - in other words it will not complain if the number
# of arguments are wrong.

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Notes - this fails on line 21 because Lambdas have strict arity, so when
# it is called without an argument for the block parameter, it raises an error
# Is also apparently fails using Lamda.new - only procs can do the Proc.new
# initialization it would seem.

# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# Notes - this tells me that even though yield is passing no arguments
# the block does not complain, it simply puts what it can and inserts nothing
# for the block parameter. This means blocks have lenient arity

# Additionally, when calling the method without a block, because the keyword
# yield has been used, you get a localjumperror for calling a block that doesn't exist.
# to get around that, you have to say block_given? for a conditional to make sure
# you're only yielding when there is a block.

# # Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}

# Note - pretty interesting behavior. Again, this shows that
# blocks can run without having the right amount of arguments. For example,
# when expecting 2 arguments, it recieved 1 and just put a blank for the second
# What's interesting is that when an argument is yielded, but no block parameter
# exists, and the variable name is then tried to be directly referenced, you still
# get the undefined local variable error because there was no block parameter to
# assign the argument to and use within the block.

=begin
In summary, the arity of a closure is how many arguments are REQUIRED to begin
passed in, and when the closure doesn't care about how many are passed in, it
has lenient arity - blocks and procs. However, Lamdas, do care how many arguments
  are passed in and will give you an error if they're not correct. This is the
  same as with methods. This is strict arity.

For blocks, you also have to have a block parameter in order to pass in a value
and use it within the block, due to it's block local scope, and you have to
make sure a block is passed if you use the yield keyword without first checking
if there is a block at all. You can always pass a block in.

  Another good observation that was in the answer, is that Lambda is a type of
  proc.
=end