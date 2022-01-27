#ABC
#xyz

=begin
initialize method

setter for lowercase
getter for uppercase


=end
class Transform

  def initialize(letters)
    @letters = letters.upcase
  end

  def self.lowercase(letters)
    letters.downcase
  end

  def uppercase
    @letters
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')