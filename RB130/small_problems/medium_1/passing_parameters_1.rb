# Modify the method below so that the display/output of items is moved to a
# block, and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items) if block_given?
  puts "Nice selection of food we have gathered!"
end

gather(items) do |produce|
  produce.each_with_index do |food, index|
    puts "#{index + 1}. #{food}"
  end
end