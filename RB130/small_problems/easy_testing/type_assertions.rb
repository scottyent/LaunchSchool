# Write a minitest assertion that will fail if value is not an instance of the
# Numeric class exactly. value may not be an instance of one of
# Numeric's superclasses.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class TypeTest < Minitest::Test
  def test_type
    value = 5
    assert_instance_of Numeric, value
  end
end