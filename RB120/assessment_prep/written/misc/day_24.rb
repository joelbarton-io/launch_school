# implementing polymorphic behavior via class inheritance

class Klass
  def initialize(name)
    @name = name
  end

  def speak
    puts "#{self.class} #{@name} says hello"
  end
end

class UnterKlass < Klass
  def speak
    puts "#{self.class} #{@name} says hi"
  end
end

jean = Klass.new("Jean")
joel = UnterKlass.new("Joel")

[jean, joel].each(&:speak)


