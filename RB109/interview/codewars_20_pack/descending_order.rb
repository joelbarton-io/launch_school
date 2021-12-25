=begin

input: non negative int
output: all digits in descending order

algo:
- transform to str, then array
- sort and reverse
- transform to str, then integer
=end

def descending_order(n)
  n.to_s.chars.sort.reverse.join.to_i
end
