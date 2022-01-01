=begin

asking us to find the next perfect square
i: perfect square num (could be non-perfect square)
o: the next perfect sqr or -1

ex: 121 sq rt -> 11, so next perfect sq is 144 (base 12)

ds: int -> int

ALGO: 

CHECK if input is perf sqr
  YES? -> next perf sqr squared (return this value)
  NO? ->  return -1
=end
def find_next_square(num)
  base = Math.sqrt(num)
  if base.round == base
    (base + 1)**2
  else
    -1
  end
end

find_next_square(121)
# time to completion: 13:30