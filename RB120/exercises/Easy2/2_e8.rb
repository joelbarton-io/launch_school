class Expander
  attr_reader :string
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private
  def expand(n)
    string * n
  end
end

expander = Expander.new('xyz')
puts expander