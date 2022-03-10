=begin

i: array of integers
o: sum of ints divided by array element count

ex:
sprintf("%#g", num)

ds: array -> float -> a string

ALGO:

sum array elements and divide sum by number of elements
display this in a string
=end

def show_multiplicative_average(arr)
  "The result is #{format("%.3f", arr.reduce(&:*) / arr.size.to_f)}"
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667