=begin
Given an array of integers from [1, 2, 3, … , 100] find the total number of 3 consecutive 
integers whose sum is prime.

i: arr of ints
o: total number of 3 cons ints which sum to a prime number

'Prime' : a natural number that is only perfectly divisible by 1 and self

ds: arr -> |op| -> set of sub_arr -> |get_sum of each sub| -> int based on count

algo:
INIT cache (cons. trio's)
TRAVERSE input
GROUPings of 3 from first..last

gets the sums of each trio
SELECT a sum if that sum is prime
COUNT the length of that resulting array
=end

def is_prime?(n)
  num = Math.sqrt(n).floor
  (2...num).all? {|divisor| (num%divisor) != 0}
end

require 'Prime'
def cons_prime(array)
  cache = []
  array.each_cons(3) do |trio|
    cache << trio
  end
  cache = cache.map(&:sum)
  cache.select {|indiv_sum| indiv_sum.prime?}.size
end
input = [*1..100]

p cons_prime()
