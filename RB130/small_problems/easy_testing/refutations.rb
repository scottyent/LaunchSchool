# Write a test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class SameTest < Minitest::Test
  def test_same
    list = [1, 2, 'xyz']
    refute_includes list, 'xyz'
  end
end

