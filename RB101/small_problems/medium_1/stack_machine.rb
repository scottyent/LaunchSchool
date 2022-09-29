# Input: a string containing numbers and commands, essentially a program.
# Output: properly executed commands result, which are numbers

# Build the following functions for this `stack-and-register` programming langauge
# * PRINT Print the register value

# Rules
# We do have bumper guards here - we can assume that all input is correct
# we can also assume all operations are done with integers (affects MOD and DIV)
# Initialize the register to be 0 to start
# Register will hold the result of operations, and is cumulative


# Algo
# Break apart the initial string, separating into integers and commands
# First things first, create a function for print that simply displays the register :DONE
# How to control the flow based on the string input?
# I need an array to represent the stack itself where these things are going to be pushed and popped from

# 1st part:
# Initialize a register to 0:DONE
# initialize aan empty array with variable name stack :DONE
# Initialize a last_integer variable to hold the number iterated over :DONE
# put these all in a hash to make for easier passing to functions :DONE
# split the input to program array :DONE

# 2nd part:
# Iterate over the program
# check if it's a number - if yes, store it in register :DONE
# create a case statement for all possible commands linked to their function calls :DONE

require 'pry'
require 'pry-byebug'

def display_error_message(type)
  messages = {
    stack: "There wasn't a value in the stack to pull",
    command: "That is not a valid command"
  }

  puts messages[type]
end


def display_register(current_count)
  puts "Register: #{current_count[:register]}"
end

# * PUSH Push the register value on to the stack. Leave the value in the register.
def push_register_to_stack(current_state)
  current_state[:stack] << current_state[:register]
end

# * ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
def add(current_state)
  begin
    current_state[:register] += current_state[:stack].pop
  rescue TypeError
    display_error_message(:stack) if current_state[:stack].empty?
  end
end

# * SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
def subtract(current_state)
  begin
    current_state[:register] -= current_state[:stack].pop
  rescue TypeError
    display_error_message(:stack) if current_state[:stack].empty?
  end
end

# * MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
def multiply(current_state)
  begin
    current_state[:register] *= current_state[:stack].pop
  rescue TypeError
    display_error_message(:stack) if current_state[:stack].empty?
  end
end

# * DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
def divide(current_state)
  begin
    current_state[:register] /= current_state[:stack].pop
  rescue TypeError
    display_error_message(:stack) if current_state[:stack].empty?
  end
end

# * MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
def remainder(current_state)
  begin
    current_state[:register] %= current_state[:stack].pop
  rescue TypeError
    display_error_message(:stack) if current_state[:stack].empty?
  end
end

# * POP Remove the topmost item from the stack and place in register
def remove(current_state)
  begin
    current_state[:register] = current_state[:stack].pop
  rescue TypeError
    display_error_message(:stack) if current_state[:stack].empty?
  end
end

def minilang(commands)
  state = {
    register: 0,
    stack: []
  }

  program = commands.split

  program.each do |input|

    if input =~ /[\d]/
      state[:register] = input.to_i
      next
    end

    case input
    when "PRINT" then display_register(state)
    when "n" then n_to_register(state)
    when "PUSH" then push_register_to_stack(state)
    when "ADD" then add(state)
    when "SUB" then subtract(state)
    when "MULT" then multiply(state)
    when "DIV" then divide(state)
    when "MOD" then remainder(state)
    when "POP" then remove(state)
    when "PRINT" then display_register(state)
    else
      display_error_message(:command)
    end
  end

  nil
end

# Test Cases
# minilang('PRINT')
# 0

# minilang('5 PUSH 3 MULT PRINT')
# 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

# minilang('5 PUSH POP PRINT')
# 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

# minilang('-3 PUSH 5 SUB PRINT')
# 8

# minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# Further Exploration
# Translate this -> (3 + (4 * 5) - 7) / (5 % 3)
# Into a command to run for the minilang program
# Result is equal to 8
# Results:

minilang("3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT")

# More further exploration - handle empty stack situations and wrong commands
# Wrong commans already done by having that at the end of the else
# empty stack...
# I did this but it got very out of hand and is very clunky with these mini methods