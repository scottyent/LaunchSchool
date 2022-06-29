require "pry"

def prompt(message)
  puts "=> #{message}"
end

def monthly_rate(loan_amount, interest_rate, loan_duration)
  loan_amount * (interest_rate / (1 - (1 + interest_rate)**(-loan_duration)))
end

def valid_integer?(number)
  number.to_i.to_s == number || number.to_i.to_s == "00"
end

def clean_and_validate(amount)
  # Splits to array, then adds back valid numbers
  array_amount = amount.split(//)
  clean_array = array_amount.select do |char|
    valid_integer?(char) || char == "."
  end
  clean_amount = clean_array.join
  if clean_amount.empty? || clean_amount == "."
    return false
  end
  clean_amount.match?(/\./) ? clean_amount.to_f : clean_amount.to_i
end

puts prompt "Welcome to the loan payment calculator!"

# Get the loan amount
loan_amount = 0
loop do
  prompt "What is the total amount of the loan?"
  loan_amount = gets.chomp
  loan_amount = clean_and_validate(loan_amount)

  if loan_amount
    break
  else
    prompt "That's not a valid amount."
  end
end

# Get the APR
interest_rate = 0
loop do
  prompt "What is the APR (annual percentage rate)?"
  interest_rate = gets.chomp
  interest_rate = clean_and_validate(interest_rate)
  interest_rate = (interest_rate / 100) / 12

  if interest_rate
    break
  else
    prompt "That's not a valid percentage."
  end
end

# Get the loan duration
loan_duration = 0
loop do
  prompt "How many months will the loan run for?"
  loan_duration = gets.chomp
  loan_duration = clean_and_validate(loan_duration)

  if loan_duration.is_a?(Float) || !loan_duration
    prompt <<-MSG
    That's not a valid format.
    Please use whole numbers representing the month.
    MSG
  else
    break
  end
end

payment = monthly_rate(loan_amount, interest_rate, loan_duration).round(2)

prompt <<-MSG

  For a loan with the following amounts:
  Loan Amount: $#{loan_amount.to_s.insert(-4, ',')}
  APR: #{(interest_rate / 0.01) * 12}%
  Duration: #{loan_duration} months

  Your monthly payment will be: $#{payment}
  MSG

=begin
Informal:

Welcome to the loan calculator.
Get the full loan amount from the user
get the APR from the user
get the loan duration from the user
store these all in variables
run verifications on this information

plug them into this very long formula m = p * (j / (1 - (1 + j)**(-n)))

m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months

=end

=begin
Formal:

START

PRINT Welcome message
GET Loan amount from user
SET to loan_amount

WHILE True
  strip it to a number?
  is this a number (either float or integer)
  break if it isn't

GET APR
SET to interest_rate
Verify the number as... a percentage?

GET Loan duration
SET to loan_duration
Verify the duration in... months?

=end
