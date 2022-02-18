class Klass
  def initialize(name)
    @name = name
  end

  attr_reader :name

  def name=(other)
    # return other + 'hi' -> this will disrupt the assignment
    @name = other
  end

  def to_s
    "My name is #{name}."
  end
end

puts joel = Klass.new("joel")
puts joel # My name is joel.
p joel.name = "James" # => "James"
puts joel # My name is James.
