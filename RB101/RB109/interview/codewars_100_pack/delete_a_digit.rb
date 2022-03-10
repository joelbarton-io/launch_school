=begin




i: int        => max number after deleting one digit

initial thought is to just delete the minimum number and then join as integers
DOESNT WORK

Implicit:
-cannot just delete minimum int

ds: int -> arr
  tools : 
        : need a cache
        : iterator 
        : all possible smaller numbers having deleted one el


ALGO:
INIT cache
GENERATE range object
TRAVERSE range
  GENERATE array of digits
  replace one of the digits with nil at curr el
  push arr to cache and join and return to int ?
  
GET max number from cache
=end

def delete_digit(n)
  cache = []
  (0...n.digits.size).each do |idx|
    original = n.to_s.chars           # alt, use `digits` + `reverse` 
    original.delete_at(idx)           # alt, use indexed assignment, assign curr to `nil`
    p original
    cache << original.join.to_i
  end
  cache.max
end
p delete_digit(152)
# time to completion: ~23:00

# MAIN TAKEAWAY => when we call `digits`, it reverses self's order