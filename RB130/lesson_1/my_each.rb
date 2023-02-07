def my_each(collection)
  index = 0

  while index < collection.size
    yield(collection[index])
    index += 1
  end

  collection
end

my_each([1, 2, 3, 4, 5]) do |num|
  puts num
end