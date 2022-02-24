class MeMyselfAndI
  self

  def self.me
    self
  end

  def myself
    self
  end
end

i = MeMyselfAndI.new
# What does each self refer to in the above code snippet?
=begin
On line 2, self refers to the enclosing class `MeMyselfAndI`. Used as a prefix
to class method `me`, `self` refers to the enclosing class. On line 5,`self`
refers to calling object of the enclosing class method: `MeMyselfAndI`. On line
9, `self` refers to the calling object of the enclosing instance method.
=end
