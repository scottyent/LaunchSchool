factorial_enum = Enumerator.new do |y|
  number = 0

  loop do
    y << ( (1..number).inject(:*) || 1 )
    number += 1
  end
end

7.times do |_|
  p factorial_enum.next
end

7.times do |_|
  p factorial_enum.next
end

factorial_enum.rewind

7.times do |_|
  p factorial_enum.next
end

factorial_enum.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end