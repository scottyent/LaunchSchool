#10 — What will the last 2 lines output in this case?

class Song
  attr_reader :title, :artist

  def initialize(title)
    @title = title
  end

  def artist=(name)
    @artist = name
    name.upcase!
  end
end

song = Song.new("Superstition")
p song.artist = "Stevie Wonder"
p song.artist

# I believe this will print
# STEVIE WONDER
# STEVIE WONDER