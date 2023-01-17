#16 — Update the Human class to have lines 11 and 14 return the desired output.

# Problem taken from tinyurl.com/mr42tf4t, creator: Raul Romero

require 'pry'
require 'pry-byebug'

class Human
  attr_reader :name
  attr_accessor :hair

  def initialize(name="Dylan")
    @name = name
  end

  def hair_color(color="blonde")
    self.hair = color
    "Hi, my name is #{name} and I have #{hair} hair."
  end

  def self.hair_color(hair_color)
    Human.new.hair_color(hair_color)
  end
end

puts Human.new("Jo").hair_color("blonde")
# Should output "Hi, my name is Jo and I have blonde hair."

puts Human.hair_color("")
# Should "Hi, my name is Dylan and I have blonde hair."