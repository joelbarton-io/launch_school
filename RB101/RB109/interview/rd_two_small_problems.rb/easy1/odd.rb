=begin
i: + or - integer
o: t/f
solution should return t if abs value of input is odd, false otherwise
=end
def is_odd?(integer)
  !(integer % 2).zero?
end
# or
def is_odd?(integer)
  integer % 2 == 0
end