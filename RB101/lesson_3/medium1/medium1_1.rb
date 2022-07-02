line = "The Flintstones Rock!"

10.times do |_|
  puts line
  line.prepend(" ")
end

=begin
or:

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

=end