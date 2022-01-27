class Pet 
  attr_reader :name, :species
  def initialize(species, name)
    @name    = name
    @species = species
  end
end

class Owner
  attr_reader :name, :yard
  def initialize(name)
    @name      = name
    @yard      = []
  end

  def pet_count
    yard.size
  end
end

class Shelter
  def initialize
    @records = Hash.new
  end

  def adopt(owner, pet)
    update_records(owner, pet)
    owner.yard << [pet.species, pet.name]
  end

  def print_adoptions
    records.each do |pet_owner, pets|
      puts "#{pet_owner} has adopted the following pets:"
      pets.each { |pet| puts pet }
      puts ''
    end
  end
  
  protected 
  attr_reader :records

  def update_records(owner, pet)
    adoptee = ["a #{pet.species} named #{pet.name}"]
    records.has_key?(owner.name) ? records[owner.name] += adoptee : records[owner.name] = adoptee
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')


shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)


=begin
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.pet_count} adopted pets."
puts "#{bholmes.name} has #{bholmes.pet_count} adopted pets."


P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.
=end