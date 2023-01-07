# Write a class to make the below work

class Transform
  attr_reader :value

  def initialize(str)
    @value = str
  end

  def uppercase
    value.upcase
  end

  def self.lowercase(item)
    item.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')


=begin
Expected output:

ABC
xyz

=end