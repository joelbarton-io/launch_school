class Student
  def initialize(name, year)
    @name = name
    @year = year
  end

  def to_s
    "#{@name}"
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end

  def to_s
    "#{super()} has parking spot #{@parking}"
  end
end

class Undergraduate < Student
end

=begin
Graduate students have the option to use on-campus parking, while
Undergraduate students do not.

Graduate and Undergraduate students both have a name and year
associated with them.
=end

joel = Undergraduate.new('Joel', 16)

north = Graduate.new('North', 17, '37b')

puts joel
puts north