=begin
i: array of integers   o: average of arr ints -> INTEGER is returned

problem considerations: arr is never empty, ints always positive, returns integer

ds: arr -> integer
ALGO: 
sum or inject/reduce + division by arr size
=end

def average(array)
  array.inject(:+)/array.size
end
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

=begin
time to completion: 3:00
we would use the longer form version of inject if we needed to start at some initial value.
syntactic sugar makes sense here given we are just summing an array. Could have used `count` in 
place of `size` and `sum` in place of inject
=end