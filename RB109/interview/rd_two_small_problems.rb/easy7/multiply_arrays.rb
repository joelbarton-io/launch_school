=begin
i: 2 arrays containing integers
o: new array, containing products 

ds: arrays throughout

algo:
init cache
traverse either array with indices
multiply respective elements and append product to cache
return cache
=end

def multiply_list(arr1, arr2)
  arr1.map.with_index { |num, idx| num * arr2.fetch(idx) }
end
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# time to completion: under 5 minutes
# should code out an implementation that works with arrays with differing lengths
# + various datatypes
