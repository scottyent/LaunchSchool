# Write the classes and methods that will be necessary to make this code
# run, and print the input at the bottom
# The order of the output does not matter, so long as all of the information is presented.

class Shelter
  attr_reader :adopters, :available_pets

  def initialize
    @adopters = []
    @available_pets = []
  end

  def adopt(person, pet)
    person.adopted_pets << pet
    available_pets.delete(pet)
    if !adopters.include?(person)
      adopters << person
    end
  end

  def add_pet(pet)
    available_pets << pet
  end

  def print_shelter_status
    puts "The Animal Shelter has the following unadopted pets:"
    available_pets.each do |pet|
      puts "a #{pet.animal} named #{pet.name} "
    end
  end


  def print_adoptions
    adopters.each do |adopter|
      puts "#{adopter.name} has adopted the following pets:"
      adopter.adopted_pets.each do |pet|
        puts "a #{pet.animal} named #{pet.name} "
      end
      puts
    end

    print_shelter_status
  end
end


class Owner
  attr_accessor :name, :adopted_pets
  def initialize(name)
    @name = name
    @adopted_pets = []
  end

  def number_of_pets
    adopted_pets.count
  end
end

class Pet
  attr_reader :animal, :name
  def initialize(animal, name)
    @animal = animal
    @name = name
  end
end

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
scott = Owner.new('Scott')

shelter = Shelter.new

butterscotch = Pet.new('cat', 'Butterscotch')
shelter.add_pet(butterscotch)
pudding      = Pet.new('cat', 'Pudding')
shelter.add_pet(pudding)
darwin       = Pet.new('bearded dragon', 'Darwin')
shelter.add_pet(darwin)
kennedy      = Pet.new('dog', 'Kennedy')
shelter.add_pet(kennedy)
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
shelter.add_pet(sweetie)
molly        = Pet.new('dog', 'Molly')
shelter.add_pet(molly)
chester      = Pet.new('fish', 'Chester')
shelter.add_pet(chester)
pingu        = Pet.new('pinguin', 'Pingu')
shelter.add_pet(pingu)
snoot        = Pet.new('dog', 'Snoot')
shelter.add_pet(snoot)

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(scott, snoot)

shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The Animal shelter has #{shelter.available_pets.count} unadopted pets."
# Expected output
# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.

# Further Exploration
# Add your own name and pets to this project.

# Suppose the shelter has a number of not-yet-adopted pets, and
# wants to manage them through this same system. Thus, you should
# be able to add the following output to the example output shown above:

# The Animal Shelter has the following unadopted pets:
# a dog named Asta
# a dog named Laddie
# a cat named Fluffy
# a cat named Kat
# a cat named Ben
# a parakeet named Chatterbox
# a parakeet named Bluebell
#    ...

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
