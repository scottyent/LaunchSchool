class Banner
  def initialize(message, width=message.size)
    @message = message
    @width = verify_width(width)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  attr_reader :width

  def verify_width(given_width)
    if given_width < @message.size
      @message.size
    elsif given_width > 80
      80
    else
      given_width
    end
  end

  def horizontal_rule
    "+-#{'-' * width}-+"
  end

  def empty_line
    "| #{' ' * width} |"
  end

  def message_line
    "| #{@message.center(width)} |"
  end
end

# Complete this class so that the test cases shown below work as intended.
# You are free to add any methods or instance variables you need. However,
# do not make the implementation details public.

#   You may assume that the input will always fit in your terminal window.

#   Test Cases
banner = Banner.new('To boldly go where no one has gone before.')
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

banner = Banner.new('How many pickles fit inside a pickle jar?')
puts banner

banner = Banner.new("Test", 20)
puts banner

banner = Banner.new("Tiny Message, BIG, box", 1)
puts banner