module A
  include Comparable, Math
  CONSTANT = "I'm a constant in #{self}"
end

class Human
  include A
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "#{name} is a #{self.class}."
  end

  def inspect
    'fake inspect'
  end
end

class Dude < Human
  attr_reader :age

  def initialize(name, age)
    super(name)
    @age = age
  end

  def to_s
    "#{name} is a #{age} year old #{self.class}."
  end
end

nan = Human.new("Nan")
joel = Dude.new("Joel", 25)

puts joel
p nan

class BankAccount
  def initialize(balance, ssn)
    @balance = balance
    @ssn = ssn
  end

  def balance
    @balance.to_f
  end

  def get_all_info
    p "#{balance} #{@ssn}"
  end

  def ssn
    @ssn.to_s.chars.last(4).join('-')
  end

  def show_balance
    p "you have #{balance} in your account"
  end
end

my_account = BankAccount.new(100, 123456789)
p my_account.ssn