# Input: a string
#: Output: a new string that reverses every single letter (from upper to lower and vice versa)

# Rules
# You have to be able to handle symbols and anything that's not a letter
# You can't use swapcase the method

def swapcase(string)

  fixed_array = string.chars.map do |character|
    case character
    when ("A".."Z")
      character.downcase
    when ("a".."z")
      character.upcase
    else
      character
    end
  end

  fixed_array.join
end
# Test Cases
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'