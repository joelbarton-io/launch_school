require 'pry'
class Practice
  @@class_var = 'class var'

  attr_accessor  :name
  def initialize(name)
    @name = name
    binding.pry
    self.name = 'Jake'
  end

  def to_s
    "@@class_var: #{@@class_var} and @name: #{@name} "
  end
end

derek = Practice.new("derek")

p derek
