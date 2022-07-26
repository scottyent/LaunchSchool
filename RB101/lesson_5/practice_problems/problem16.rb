require 'securerandom'

HEXADECIMAL = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd', 'e', 'f']

def generate_UUID()
  uuid = ''
  sections = [8, 4, 4, 4, 12]
  sections.each do |number_to_add|
    number_to_add.times { uuid << HEXADECIMAL.sample.to_s }
    uuid << '-' unless number_to_add == 12
  end

  uuid
end

p SecureRandom.uuid
