# Write a minitest assertion that will fail if the class of value is not
# Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).




require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class KindTest < Minitest::Test
  def test_type
    value = 'word'
    assert_kind_of Numeric, value
  end
end