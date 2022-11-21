# Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

=begin
Alyssa glanced over the code quickly and said -
"It looks fine, except that you forgot to put the @ before balance when
you refer to the balance instance variable in the body of the
positive_balance? method."

"Not so fast", Ben replied. "What I'm doing here is
valid - I'm not missing an @!"

Who is right, Ben or Alyssa, and why?
I believe Ben is right, becuase this is not assigning, it's a logical comparison
which just needs appropriate values on either side. The attr_reader allows you
to call balance and get the value inside that instance variable, so I believe
this would work.

If it was setting, such as += 1. That would be different, you'd need a self
or a @ an front otherwise it would treat it like a newly initialized local
variable
=end

scott = BankAccount.new(1_000_000)
puts scott.positive_balance?
puts scott.balance