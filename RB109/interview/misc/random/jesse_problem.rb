# Given an array of integers, find the maximal size of the 
# subarray of consecutive integers whose sum is a prime number.

# For example [1, 3, 1, 0, 1, 6, 6] == 6, because the subarray 
# [3, 1, 0, 1, 6, 6] is the longest consecutive subarray whose numbers, 
# when added up, equal to a prime number, 17.


=begin

i: array of ints

o: maximal subarray whose elements sum to a a prime number

ds: arr -> |sub_arr.sum prime?| -> arr of subs who sum prime -> get longest -> return longest sub_arr


algo:


GENERATE a list of all the sub arrays possible from input array

INIT caching arr
TRAVERSE ^ list, checking to see if a sub_arr sums prime (select)
  -> sum first, then check if result is prime
  -> if does sum prime, then store in some out cache arr (prime subs)
    
  -> next element if not summing prime

get longest array from cache arr  -> return this array -> max_by/max length **

=end

# def get_all_subs(array)
#   leng = array.size
#   cache = []
#   (0..leng - 1).each do |start_idx|
#      (start_idx...leng).each do |end_idx|
#        cache << array[start_idx..end_idx]
#      end
#   end
#  cache
# end

def prime(num)
  (2...num).select {|trial| num%trial == 0}.empty?
end

# def max_prime_sub(array)
#   return 0 if array.empty?
#   sub_arrs = get_all_subs(array)

#   prime_subs = sub_arrs.select do |candidate|
#     is_prime?(candidate.sum)
#   end
#   return 0 if prime_subs.empty?
  
#   prime_subs.max_by(&:length).size
# end

# def is_prime?(sum)
#   return false if sum.zero? || sum == 1
#   (2...sum).none? do |divisor|
#     (sum%divisor).zero?
#   end
# end

# p max_prime_sub([1, 3, 1, 0, 1, 6, 6]) == 6
# p max_prime_sub([]) == 0
# p max_prime_sub([1]) == 0
# p max_prime_sub([7, 13, 9, 1, 3]) == 3
# p max_prime_sub([1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0]) == 13
# p max_prime_sub([100, 100, 100, 50, 3, 1, 1, 1]) == 5

Write a method to find the longest common prefix string aomonst an array of strings. 
If there is no common prefix, return an empty string ''.

ex:

in: ['flower', 'flow', 'flight']
out: 'fl'

ex:

in: ['dog', 'racecar', 'car']
out:  ''

no common prefix