=begin
i: nth in sequence         o: fibonacci nth


algo:

INIT a seed array [1, 1]
UNTIL seed length is equivalent to input nth
  push the sum of the last two digits in seed, into seed
  FINISH
RETURN the last element in seed
=end 
def fibonacci(nth)
  seed = [1, 1]
  until seed.size.eql?(nth) do
    seed << (seed[-1] + seed[-2])
  end
  seed.last
end

# p fibonacci(100001)
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end