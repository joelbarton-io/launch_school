class Pet
  attr_reader :name

  def initialize(name)
    @name = name.downcase
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)

# puts fluffy.name #String#to_s -> 'fluffy'
# puts fluffy      #"My name is FLUFFY."
# puts fluffy.name #'FLUFFY'
# puts name        #'Fluffy'

# puts fluffy.name #
# puts fluffy      #
# puts fluffy.name #
# puts name        #
