# Complete this class so that the test cases shown below work as intended.
# You are free to add any methods or instance variables you need.
#  However, do not make the implementation details public.

#   You may assume that the input will always fit in your terminal window.

=begin
Input:
Output: a nicely printed banner with the message in the middle

Rules
Explicit:
* It will always fit in your terminal
* Don't make the implementation details public (not really sure what's meant by implementation)
* like is it variables or is it methods?
Implicit:
* There is a blank line over the top and the bottom of the message in the middle
* the outer sides basically expand to fill the message,
* there is a space buffer to either side of the message, or if there is none just to spaces in the middle

Algorithm:
*

# Further exploration
# Modify this class so new will optionally let you specify a fixed banner width
# at the time the Banner object is created. The message in the banner should be
# centered within the banner of that width. Decide for yourself how you want to
# handle widths that are either too narrow or too wide.

Algo:
* create width as instance variable you can initialize, with a default of the message size :DONE
* adjust the message line so that it can dynamically grow with the width :DONE
  - if message < width
      insert a buffer that equals width - message.size/2
      alternative method - use the center method :DONE
* Handle the case of width being larger than 80 or smaller than the message
  * if larger than 80, I think just trim to 80 with an error :DONE
  * if smaller than message, just adjust it up to the size of the message. You could
    in theory wrap the message at that point but that's getting a bit complicated.

=end

require 'pry'
require 'pry-byebug'

class Banner
  MAX_WIDTH = 80
  def initialize(message, width=message.size)
    @message = message
    @width = validate_width(width)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def validate_width(width)
    if width > MAX_WIDTH
      puts "Width too wide. Adjusted to #{MAX_WIDTH}"
      MAX_WIDTH
    elsif width < @message.size
      puts "Message larger than width. With adjusted to #{@message.size}"
      @message.size
    else
      width
    end
  end

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    return "| #{@message} |" if @message.empty?
    "| #{@message.center(@width)} |"
  end
end

# Test cases
banner = Banner.new('To boldly go where no one has gone before.', 100)
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+
