require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'transaction'
require_relative 'cash_register'
require 'stringio'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    purchase = Transaction.new(30)
    input = StringIO.new("30\n")
    purchase.prompt_for_payment(input: input)

    assert_equal purchase.amount_paid, 30
  end
end