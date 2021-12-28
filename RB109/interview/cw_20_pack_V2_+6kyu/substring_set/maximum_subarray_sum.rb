=begin

goal: find the max sum of a subarray

i: some array, potentially empty, containing positive and negative integers
o: the sum of the sub array with the greatest sum

rules and conditions:
- if input is all postive integers, just return input.sum
- if input is all negatives, return 0, also for empty array

data-structure: I think it makes sense to use a cache array, so pushing each sub array into a 
storage array, then selecting the sub array with the max value (this can potentially be zero or empty)

algo:

- first, implement early return: all positives, all negatives, empty array, etc
- second, start traversing the input array, establish takeser and storage arr as well
- third, start pushing subarrays to storage: storage << arr.slice(index, takeser)
- index is updated, takes is reset

- now we have all sub arrays
- maybe max_by(&:sum) return the max sum from all the arrays

=end
def max_sequence(array)
  return 0 if array.all?(&:negative?) || array.empty?
  storage = []
  
  array.each.with_index do |_, idx|
    end_point = array.size - idx
    takes = 0
  
    until takes > end_point do
      storage << array.slice(idx, takes)
      takes += 1
    end
  end
  storage.max_by(&:sum).sum
end
#.reject(&:empty?)
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4])

# endpoint = 4
# idx = 0
# takes = 1 : 2 : 3 : 4

# endpoint = 3
# idx = 1
# takes = 1 : 2 : 3

# endpoint = 2
# idx = 2
# takes = 1 : 2 

# endpoint = 1
# idx = 3
# takes = 1

