# Write a minitest assertion that will fail if the value.odd? is not true.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!


class BooleanTest < Minitest::Test
  def setup
    @number = 4
  end

  def test_odd_value
    assert_equal true, @number.odd?
  end
end