=begin
Input: will take a string, representing the register actions
Output: execute the actions, printing where appropriate the register value

Rules
Explicit:
* initialize the register to 0 :DONE
* produce an error if there is an invalid command, and include that command
then break out of the execution
* produce an error if stack is empty
* every number is an integer
Implicit:
* have one longer eval function to execute, similar to a game loop
* instructions are separated by a space


Algorithm:
* split the string into an instructions array :DONE
* initialize the program with a register value of 0 :DONE
* initialize an empty stack as an array :DONE

* define each action with its own method that does what that action is
* define an eval method that will loop through the needed actions
and basically execute each method
* errors I have to be careful of
- any time, if I try to pop and it is an empty stack, provide an error.
- if the current command isn't a valid integer or in the methods list, error


  It'll get a little out of control if I try to plan all of this so I'm going to
  spike
=end

require 'pry'
require 'pry-byebug'

class EmptyStack < StandardError; end

class Minilang
  attr_accessor :stack, :register

  def initialize(string_commands)
    @commands = string_commands
    @stack = []
    @register = 0
  end

  def eval(missing_data)
    @commands = format(@commands, missing_data).split
    @commands.each do |input|
      command = input.downcase

      if valid_integer?(input)
        load_register(input.to_i)
      elsif self.methods.include?(command.to_sym)
        begin
          send(command)
        rescue EmptyStack
          puts "Empty Stack!"
          break
        end
      else
        puts "#{input} is not a valid command. Process aborted."
        break
      end
    end
  end

  protected

  def load_register(value)
    self.register = value
  end

  def push
    stack << register
  end

  def add
    begin
      self.register += stack.pop
    rescue NoMethodError
      raise EmptyStack
    end

  end

  def sub
    begin
      self.register -= stack.pop
    rescue NoMethodError
      raise EmptyStack
    end

  end

  def mult
    begin
      self.register *= stack.pop
    rescue NoMethodError
      raise EmptyStack
    end

  end

  def div
    begin
      self.register /= stack.pop
    rescue NoMethodError
      raise EmptyStack
    end

  end

  def mod
    begin
      self.register %= stack.pop
    rescue NoMethodError
      raise EmptyStack
    end

  end

  def pop
    self.register = stack.pop
    raise EmptyStack if register == nil
  end

  def print
    puts register
  end

  def valid_integer?(number)
    number.to_i.to_s == number
  end
end

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'

minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)

minilang.eval(degrees_c: 100)

# # Test Cases
# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)