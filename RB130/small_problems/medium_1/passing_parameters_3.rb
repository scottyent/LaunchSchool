items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below:

# 1 - DONE
# gather(items) do |*group1, last_item|
#   puts group1.join(", ")
#   puts last_item
# end

# Output
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

#2 - DONE
# gather(items) do |first_item, *middle_group, last_item|
#   puts first_item
#   puts middle_group.join(', ')
#   puts last_item
# end

# Output
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

#3 - DONE
# gather(items) do |first_item, *remaining_items|
#   puts first_item
#   puts remaining_items.join(', ')
# end

# Output
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!


#4 - DONE
gather(items) do |item1, item2, item3, item4|
  puts "#{item1}, #{item2}, #{item3}, and #{item4}"
end

# Output
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!