# 9 — What will the last three lines of code print to the console? After
# song.artist is called, what would be returned if we inspect the song object?

class Song
  attr_reader :title, :artist

  def initialize(title)
    @title = title
    @artist
  end

  def artist=(name)
    @artist = name.upcase
  end
end

p song = Song.new("Superstition")
p song.artist = "Stevie Wonder"
p song.artist

# Line 17 would print the results of #inspect, called on the song object.
# since it is an instantiated object of class Song, it would return an object_ID
# with the attribute of @title = "Superstition" and I THINK of @artist = nil
# because it's at least listed there in the initializaiton. (This was wrong.
# It only shows superstition because it was initialized to a value, nothing else
# shows because it wasn't initialized to an actual value.)

# Line 18 would print "Stevie Wonder" because setters always return the value that
# is passed into it

# Line 19 would print "STEVIE WONDER" becuase the setter method calls upcase on the
# value, and that is what is ultimatley stored in the instance variable @artist

# Yeah and lastly to answer that question, the new object if inspected would
# now show both title and artist as attributes in the object definition