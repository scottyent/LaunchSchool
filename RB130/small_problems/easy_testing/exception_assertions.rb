# Write a minitest assertion that will fail unless employee.hire raises a
# NoExperienceError exception.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class ExceptionTest < Minitest::Test
  def test_exception
    assert_raises NoExperienceError { employee.hire }
  end
end