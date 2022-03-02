# CLASS & INSTANCE VARIABLES/METHODS
class Klass
  @@class_var = 'class var'

  def initialize(instance_var); @instance_var = instance_var; end

  def self.a_class_method
    p @@class_var
    p @instance_var
  end

  def an_instance_method
    p @@class_var
    p @instance_var
  end
end
# Klass.a_class_method
# Klass.new("Instance var").an_instance_method
# instance methods can access both instance variables and class variables class methods can only access class variables

# CUSTOM SETTER

class Game
  def initialize
    @score = 0
  end

  attr_reader :score

  def increment_score(points)
    p self.score += points
  end

  private

  attr_writer :score
end
# attr_writer :score is private, meaning it can only be invoked from within the class by another method `increment_score` does this

# CUSTOM GETTER & SETTER METHODS

class Purchase
  def initialize(cc_num); @cc_num = cc_num.to_s; end

  def cc_num
    "ending in #{@cc_num.chars.last(4).join}"
  end

  def cc_num=(new_num)
    @cc_num = new_num.to_s
  end

  def thank_you
    p "thank you for your purchase, you used the credit card #{cc_num}"
  end
end

# my_purchase = Purchase.new(1234567890)
# p my_purchase.cc_num
