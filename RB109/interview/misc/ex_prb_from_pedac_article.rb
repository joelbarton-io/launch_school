=begin

i: target (integer); two factors (integers)
o: sum (integer)

rules:
- if no factors are given, defaults = 3, 5
- target will always be an integer greater than zero

considerations:
- a 'multiple' is a number that is divisible by another: 
  3 is divisible by 1 because 3/1 = 0 (no remainder)

Example:
target = 20, factors = 3, 5
output: 78

Data-structure: 
cache array to store multiples of factors

Algorithm:

- unless factors are given: factors are 3 and 5 by default
- initialize a cache 
- starting from 1 going up to (not including) the target number
  - if current number is divisible by either factor, add that number to our cache
  - otherwise, go next
- done iterating

- take the sum of the numbers in our cache and return

time to completion: ~ 13:00
=end

def sum_of_multiples(target, factors = [3, 5])
  cache = []
  1.upto(target - 1) do |num|
    if factors.size.eql?(2)
      cache << num if (num % factors[0]).zero? || (num % factors[1]).zero?
    elsif factors.size.eql?(1)
      cache << num if (num % factors[0]).zero?
    end
  end
  p cache.reduce(&:+)
end
sum_of_multiples(20, [3, 5])  # returns 78
sum_of_multiples(20, [3])     # returns 63
sum_of_multiples(20, [5])     # returns 30
sum_of_multiples(20, [])      # returns 78
sum_of_multiples(1, [])       # returns 0
sum_of_multiples(20, [19])    # returns 19