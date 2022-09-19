# Input: String
# Output: Same as before, but non alphabetic characters don't count

require 'pry'
require 'pry-byebug'

def staggered_case(words, start_caps: true, count_non_alphabetic: true)
  even_odd_counter = start_caps ? 0 : 1

  fixed_array = words.chars.map do |char|
    transformed_letter = even_odd_counter.even? ? char.upcase : char.downcase

    if count_non_alphabetic
      even_odd_counter += 1
    else
      even_odd_counter += 1 if char =~ /[A-Za-z]/
    end

    transformed_letter
  end

  fixed_array.join
end

# Test cases
p staggered_case('I Love Launch School!', count_non_alphabetic: false) == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS', count_non_alphabetic: false) == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers', count_non_alphabetic: false) == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

