# Input: a single string formatted as first name + space + last name ('Scott Entwistle')
# Output: a string that is Last name, First name

# Algo
# split and multi assign to first last
# Interpolate a string with the new format

def swap_name(name_string)
  first, last = name_string.split
  "#{last}, #{first}"
end

# Test Cases
p swap_name('Joe Roberts') == 'Roberts, Joe'
p swap_name('Anna Banana') == 'Banana, Anna'
p swap_name('Billy Hampton') == 'Hampton, Billy'