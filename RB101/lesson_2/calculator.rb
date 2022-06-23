require "yaml"
MESSAGES = YAML.load_file('calculator_messages.yml')
p MESSAGES

# Ask the user for 2 numbers
# Ask whether they want to multiply, divide, add, or subtract
# Perform the operation
# Output the results

# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  if num.include?(".")
    num.to_f.to_s == num
  else
    num.to_i.to_s == num
  end
end

def operation_to_message(op_number)
  case op_number
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES["welcome"])

name = nil
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES["valid_name"])
  else
    break
  end
end

prompt("Hi, #{name}")

loop do
  number1 = nil
  loop do
    prompt(MESSAGES["number_one"])
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES["invalid_number"])
    end
  end

  number2 = nil
  loop do
    prompt(MESSAGES["number_two"])
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES["invalid_number"])
    end
  end

  operator_prompt = <<-MSG
  Which operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
  MSG

  prompt(operator_prompt)

  operator = nil
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include? operator
      break
    else
      prompt(MESSAGES["invalid_operation"])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")
  # sleep(1)

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}")

  prompt(MESSAGES["go_again"])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES["goodbye"])
