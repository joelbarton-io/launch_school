class Klass
  attr_accessor :sex, :name

  def initialize(name)
    @name = name
  end
end

joel = Klass.new("joel")
p joel.name
p joel.sex
