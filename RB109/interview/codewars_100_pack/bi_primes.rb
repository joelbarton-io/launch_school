=begin
Write a method bi_prime?(num) that accepts a number as an arg and returns a 
boolean indicating whether or not the number is a bi-prime. A bi-prime is a 
positive integer that can be obtained by multiplying two prime numbers.
14 is a bi-prime because 2 * 7
22 is a bi-prime because 2 * 11
25 is a bi-prime because 5 * 5
24 is not a bi-prime because no two prime numbers have a product of 24
puts bi_prime?(14)   # => true
puts bi_prime?(22)   # => true
puts bi_prime?(25)   # => true
puts bi_prime?(94)   # => true
puts bi_prime?(24)   # => false
puts bi_prime?(64)   # => false

i: number (as target)
o: boolean true if two primes can be multiplied to target

considerations:

  -> prime1 * prime2 == target
  -> pool: (2...target)
  -> target is always positive integer

ds: int -> arr of primes

from the pool of prime numbers smaller than target...
are there any pairs that, when multiplied together, eql target?

algo:
GENERATE pool of primes below target

multiplying each number by the other, check if any pair produces the target
  
nested loop structure using ranges...
  arr of primes -> traverse these indices...
    check if any produce is == to input n
      return true
    --
  --
false
=end

def get_primes(n)
  (2...n).select do |candidate|
    (2...candidate).none? {|divisor| (candidate%divisor) == 0}
  end
end

def bi_prime?(n)
  pool = get_primes(n)
  (0...pool.size).each do |idx1|
    (idx1...pool.size).each do |idx2|
      return true if (pool[idx1]*pool[idx2]).eql?(n)
    end
  end
  false
end

puts bi_prime?(14)   # => true
puts bi_prime?(22)   # => true
puts bi_prime?(25)   # => true
puts bi_prime?(94)   # => true
puts bi_prime?(24)   # => false
puts bi_prime?(64)   # => false

# time: 21 minutes