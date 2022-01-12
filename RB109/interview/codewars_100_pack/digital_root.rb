=begin


Digital root is the recursive sum of all the digits in a number.

Given n, take the sum of the digits of n. If that value has more than one digit, 
continue reducing in this way until a single-digit number is produced. The input 
will be a non-negative integer.

i: integer        o: int

considerations: 
              -> input is always a non-negative integer
              -> 'digital root' : recursive sum of all digits in a number

ds: int -> str -> |arr of ints| -> int |loop point| -> int

algo:

RETURN input if input length == 1 

UNTIL input length == 1 
  CONVERT input to str then to arr of ints 
  GET sum of array of integers -> int
LOOP point
type conversion?
RETURN integer 

Examples
    16  -->  1 + 6 = 7
   942  -->  9 + 4 + 2 = 15  -->  1 + 5 = 6
132189  -->  1 + 3 + 2 + 1 + 8 + 9 = 24  -->  2 + 4 = 6
493193  -->  4 + 9 + 3 + 1 + 9 + 3 = 29  -->  2 + 9 = 11  -->  1 + 1 = 2
=end

def digital_root(n)
  until n.to_s.chars.size == 1 do
    ints_arr = n.to_s.chars.map(&:to_i)
    n = ints_arr.sum
  end
  n
end

p digital_root(16) == 7 
p digital_root(942) == 6 
p digital_root(132189) == 6 
p digital_root(493193) == 2

# time: 11 minutes