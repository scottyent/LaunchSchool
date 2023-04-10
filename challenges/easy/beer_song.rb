# Write a program that can generate the lyrics of the 99 Bottles of Beer song.
# See the test suite for the entire song.

# Input: will be a number (or numbers) given a verse (or verses) method
# respectively. These will be class methods of the BeerSong class
# Output: the text of the song, in a verse per number either for that verse
# (for the verse method) or for a range of verses (for the verses method)

# Rules
# Explicit:
# * BeerSong.lyrics should generate the entire lyrics
# * Three options for class methods then - lyrics, verses, verse
# * in verses, it's from highest number counting down (inclusive) to the second
# number given

# Implicit:
# * When you get to one, and zero - they have special requirements
#    - One -> 1 bottle of beer on the wall
#    - Zero -> no more bottles of beer on the all
# * there are two new lines at the end of each verse, and one new line after
# each sentence

# Algorithm:
# * I believe I should just have one funciton as far as generating the song right?
# I could just have one verse generator, and call it from verses or lyrics by
# counting down the range and passing it to the verse generator. E.g.
# Lyrics - has a countdown from 99 - 0 and passes each number in as it goes
# Verses - has a countdown from the range given, and passes each number as it goes
# verses - generates the appropriate verse either for the individual number we give it
# or the number passes by the other functions

# In order to generate the verse - I could do a Heredoc. Add in the one extra
#   return at the end, but the rest should function as needed.

# TODO: Generate a singular verse without additional trailing newlines - :DONE
# TODO: Handle when you hit 2, 3, 1 bottles left :DONE
# TODO: create Verses class that will iterate over a range, and insert the neeeded
# new line between verses :DONE

class BeerSong
  def self.verse(verse_number)
    if verse_number == 0
      return <<~VER
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.
      VER
    end

    first = assign_bottles(verse_number)
    second = assign_bottles(adjusted_bottle_number(verse_number))

    <<~VER
      #{first} of beer on the wall, #{first} of beer.
      Take #{(verse_number == 1) ? "it" : "one"} down and pass it around, \
      #{second} of beer on the wall.
    VER
  end

  def self.adjusted_bottle_number(number)
    (number == 0) ? 99 : number - 1
  end

  def self.verses(start, stop)
    snippet = ""

    start.downto(stop) do |num|
      snippet << verse(num) + "\n"
    end

    snippet.chomp
  end

  def self.lyrics
    verses(99, 0)
  end

  def self.assign_bottles(number)
    case number
    when (2..99) then "#{number} bottles"
    when 1 then "#{number} bottle"
    when 0 then "no more bottles"
    end
  end
end
