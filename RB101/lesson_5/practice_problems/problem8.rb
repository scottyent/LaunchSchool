# Using the each method, write some code to output all of the vowels from the strings.
# I'm really not to sure aobut the ask here, but I'll take it to mean go through and if a letter is a vowel just print it?

VOWELS = %w(a e i o u)

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}


hsh.each_value do |array|
  array.each do |word|
    word.each_char { |letter| puts letter if VOWELS.include?(letter) }
  end
end

