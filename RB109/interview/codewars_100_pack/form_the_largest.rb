=begin

i: num (set of digits)   => digits arranged such that number is maximized


DS: INT -> ARR -> RRA -> STR -> INT

ALGO
convert input to array of digits
SORT by ascii
REVERSE and JOIN and CONVERT back to int
=end

def max_number(n)
  n.digits.sort.reverse.to_s.to_i
end
# time to completion: < 3:00