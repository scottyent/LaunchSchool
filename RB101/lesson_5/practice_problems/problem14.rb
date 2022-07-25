hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

test_result = [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

result = hsh.values.map do |hash|
  if hash[:type] == 'fruit'
    hash[:colors].map { |color| color.capitalize }
  else
    hash[:size].upcase
  end
end

p result == test_result