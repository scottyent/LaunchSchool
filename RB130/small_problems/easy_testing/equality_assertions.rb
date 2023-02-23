# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Equality < Minitest::Test

  def test_equality
    str = "FORTY"
    assert_equal('xyz', str.downcase)
  end
end

