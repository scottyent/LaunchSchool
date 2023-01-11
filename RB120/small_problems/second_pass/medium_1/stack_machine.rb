require 'pry'
require 'pry-byebug'


class InvalidCommand < StandardError
  # def initialize(msg="That is not a valid command", exception_type="custom")
  #   @exception_type = exception_type
  #   super(msg)
  # end
end

class EmptyStack < StandardError
  def initialize(msg="The stack is empty.")
    super(msg)
  end
end

class Minilang
  COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
  STACK_COMMANDS = %w(ADD SUB MULT DIV MOD POP)

  def initialize(commands)
    @commands = commands.split
    @stack = []
    @register = 0
  end

  def push
    stack << register
  end

  def add
    self.register = register + stack.pop
  end

  def sub
    self.register = register - stack.pop
  end

  def mult
    self.register = register * stack.pop
  end

  def div
    self.register = register / stack.pop
  end

  def mod
    self.register = register % stack.pop
  end

  def pop
    self.register = stack.pop
  end

  def print
    puts register
  end

  def valid_integer?(input)
    input.to_i.to_s == input
  end

  def eval
    @commands.each do |command|
      if valid_integer?(command)
        self.register = command.to_i
      else
        raise InvalidCommand unless COMMANDS.include?(command)
        raise EmptyStack if STACK_COMMANDS.include?(command) && stack.empty?
        prepared_command = command.downcase.to_sym
        send(prepared_command)
      end
    end
  end

  private

  attr_accessor :register, :stack
end



# Test
Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)