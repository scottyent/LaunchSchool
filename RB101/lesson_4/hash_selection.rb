# Input: A hash with strings as keys and values
# Output: Return a hash that only contains the key/value pairs where value -- "Fruit"

# Algo
# Accept the new hash
# Create a blank hash to be returned
# loop through the current hash, and pick the ones where value is fruit, and add that to the new results hash
# return new hash


# Implementation 1 - I took some shortcuts with .each here
# def select_fruit(fruits_veggies_hash)
#   fruits_only = Hash.new

#   fruits_veggies_hash.each do |k, v|
#     if v == "Fruit"
#       fruits_only[k] = v
#     end
#   end

#   fruits_only
# end

# Formal solution using simply a loop and a counter
def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}