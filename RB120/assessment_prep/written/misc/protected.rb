module A; end

class Klass
  def initialize(name)
    @name = name
  end

  def ==(other)
    name == other.name
  end

  # protected
  private

  attr_reader :name
end

class UnterKlass < Klass; end

instance_of_klass = Klass.new("Joel")
instance_of_unterklass = UnterKlass.new("Joel")

p instance_of_klass.class      # => Klass
p instance_of_unterklass.class # => UnterKlass
# p instance_of_klass == instance_of_unterklass # => true

p instance_of_klass.send :name # we invoked a protected method!

p UnterKlass.superclass.superclass.superclass.superclass
#           ^Klass     ^Object    ^BasicObject ^nil
