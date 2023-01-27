class Human
  attr_reader :name, :hair

  def initialize(name="Dylan")
    @name = name
  end

  def hair_colour(new_color="blonde")
    @hair = new_color
    "Hi, my name is #{name} and I have #{hair} hair."
  end

  def self.hair_colour(new_color)
    Human.new.hair_colour
  end
end

puts Human.new("Jo").hair_colour("blonde")
# Should output "Hi, my name is Jo and I have blonde hair."

puts Human.hair_colour("")
# # Should "Hi, my name is Dylan and I have blonde hair."

