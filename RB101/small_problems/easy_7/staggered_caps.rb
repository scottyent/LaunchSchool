# Input: A string
# Output: a new string that alternates capitalization

# Rules
# You need to handle non letter characters
  # They don't get transformed, but do count in flipping from uppercase to lowercase

# Algo
# Since we want to include spaces and symbols, split by characters from the beginning
# set a cuonter to 0
# Map iterate over the chars array
# If the even_odd_counter is even, upcase the char, otherwise downcase
# increment the even_odd_counter
# return the new mapped array .join'd

def staggered_case(words, start_caps=true)
  even_odd_counter = start_caps ? 0 : 1

  fixed_array = words.chars.map do |char|
    transformed_letter = even_odd_counter.even? ? char.upcase : char.downcase
    even_odd_counter += 1

    transformed_letter
  end

  fixed_array.join
end

# Test Cases
p staggered_case('I Love Launch School!', start_caps=false) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'