def palindromic_number?(number)
  string = number.to_s
  string == string.reverse
end

# Tests
p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
p palindromic_number?(00002520000) == true
p palindromic_number?(000020000) == true
p palindromic_number?(0035300) == true