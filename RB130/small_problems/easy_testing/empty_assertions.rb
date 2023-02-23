# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EmptyTest < Minitest::Test
  def test_empty_array
    array = []
    assert_equal true, array.empty?
  end

  def test_easier_empty
    item = []

    assert_empty item
  end
end