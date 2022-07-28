def palindrome?(item)
  forward_count = 0
  backwards_count = item.size - 1

  while backwards_count >= 0
    return false if item[forward_count] != item[backwards_count]
    backwards_count -= 1
    forward_count += 1
  end
  true
end

def real_palindrome?(input)
  array_characters = input.upcase.chars
  alphanumberic = array_characters.select do |char|
    ('A'..'Z').include?(char) || (0..9).include?(char)
  end

  palindrome?(alphanumberic)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false