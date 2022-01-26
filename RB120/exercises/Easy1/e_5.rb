class Person
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = capitalize(first_name)
    @last_name = capitalize(last_name)
  end

  def first_name=(first_name)
    @first_name = capitalize(first_name)
  end

  def last_name=(last_name)
    @last_name = capitalize(last_name)
  end

  def capitalize(name)
    name.capitalize
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person

# John Doe
# Jane Smith