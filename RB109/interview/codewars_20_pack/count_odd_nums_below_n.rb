=begin
P: 
i: int    o: number of odd ints below (non-inclusive) of input

ALGO:
if input is odd, then the sum of + odd numbers is equal to:  (input -1)/ 2
if input is even, then: input / 2

=end
def odd_count(n)
  n.odd? ? (n-1)/2 : n/2
end