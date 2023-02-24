# Usage of the listening device:
# Listen for something
#   if anything is said,
#     record it for later use.
#   If nothing is said,
#   then do not record anything.

# The representation of something being said, is a block. If passed on, it's
# recording something. If no block, nothing is being said.

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"