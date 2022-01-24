=begin
# 1.
class Person
  attr_accessor :name

  def initialize(n)
    @name = n
  end
end

# 2. 
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first
    @last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end
=end

# 3.
class Person
  attr_accessor :first_name, :last_name
  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

  def to_s
    name
  end
  private

  def parse_full_name(full_name)
    parts = full_name.split(' ')
    self.first_name = parts.first
    self.last_name  = parts.size > 1 ? parts.last : ''
  end
end

# 4.

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts "The person's name is: #{bob}." 
#
