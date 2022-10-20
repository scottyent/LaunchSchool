# We wrote a neutralize method that removes negative words
# from sentences. However, it fails to remove all of them.
# What exactly happens?

# Answer - what's happening is that the code inside the block
# is mutating the array that it's iterating over, causing it
# to skip the word boring in the iteration.
# I fixed this by using select, and filtering out the bad words with the negative? method

require 'pry'
require 'pry-byebug'

def neutralize(sentence)
  words = sentence.split(' ')
  words.select! do |word|
    !negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.