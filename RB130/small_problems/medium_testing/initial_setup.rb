require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @kasse1 = CashRegister.new(500)
    @transaction1 = Transaction.new(20)
  end

  def test_accept_money
    @transaction1.amount_paid = 20

    before_transaction = @kasse1.total_money
    @kasse1.accept_money(@transaction1)
    after_transaction = @kasse1.total_money

    assert_equal before_transaction + 20, after_transaction
  end

  def test_change
    @transaction1.amount_paid = 30

    difference = @transaction1.amount_paid - @transaction1.item_cost
    given_change = @kasse1.change(@transaction1)

    assert_equal difference, given_change
  end

  def test_give_receipt
    expected_output  = "You've paid $#{@transaction1.item_cost}.\n"

    assert_output(expected_output) { @kasse1.give_receipt(@transaction1) }
  end

  def

end