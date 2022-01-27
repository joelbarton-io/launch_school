class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata # => 'ByeBye'
puts thing.dupdata     # => "HelloHello"

=begin
do instance variables append normally?
Does ruby know when we invoke a class method
  to look for class methods first, or instance methods
  first?

=end
