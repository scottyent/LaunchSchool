require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'text_method'

class TextTest < Minitest::Test
  def setup
    @sample_text = File.open('./sample_text.txt')
    @text = Text.new(@sample_text.read)
  end

  def test_swap
    swapped_text = @text.swap('a', 'e')

    refute swapped_text.include? 'a'
  end

  def test_count
    assert_equal 72, @text.word_count
  end

  def teardown
    @sample_text.close
  end
end