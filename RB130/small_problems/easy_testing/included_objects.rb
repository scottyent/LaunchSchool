# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class IncludedTest < Minitest::Test
  def test_included
    list = [1, 2, 'XYZ']
    assert_includes list, 'xyz'
  end
end