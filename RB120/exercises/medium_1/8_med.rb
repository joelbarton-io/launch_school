class Card
  attr_reader :rank, :suit
  FACE = ['Jack', 'Queen', 'King']

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    if FACE.include?(self.rank) && FACE.include?(other.rank)
      # both are face cards
      if self.rank == other.rank
        0
      elsif
        
      end

    elsif FACE.include?(self.rank) ^ FACE.include?(other.rank)
      FACE.include?(self.rank) ? 10 <=> other.rank : self.rank <=> 10
    else
      self.rank <=> other.rank
    end
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

cards = [Card.new(2, 'Hearts'), Card.new(3, 'Hearts'), Card.new(5, 'Hearts')]

puts cards.min
=begin
cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
=end