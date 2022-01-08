=begin
In this Kata, you will be given two integers n and k and your task is to remove k-digits from n and return the lowest number possible, without changing the order of the digits in n. Return the result as a string.


Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible number. The best digits to remove are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.


Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed 8 and 9.


i: integer, number of digits we are allowed to remove from integer
o: string as integer minimum


GOAL -> somehow, we need to remove k-digits at random places -> 
IDEA -> generate substring of all possible integers that have k-digits removed

ds: int -> str -> arr |array_of_candidates| -> array of ints -> get minimum value

ALGO: 

until we have all possible substrings of length: input.size - k, we can't  begin to find the minimum

find all substrings from input w length: (input.size - k)


=end

# def solve(number, delete_count)
#   number_as_chars = number.to_s.chars
#   candidates = number_as_chars.combination(number.to_s.size - delete_count).to_a
#   candidates.map(&:join).min
# end

=begin
def solve(n,k)
  array = n.to_s.chars
  k.times do
    set = []
    array.each_index do |idx|
      arr = array.clone
      arr.slice!(idx, 1)
      set << arr
      p set
    end
    array = set.min
  end
  array.join
end
=end

# p solve(123056,1) == '12056'
# p solve(1284569,1) == '124569'
# p solve(123056,2) == '1056'
# p solve(1284569,2) == '12456'
# p solve(123056,3) == '056'
# p solve(1284569,3) == '1245'
# p solve(123056,4) == '05'
# p solve(1284569,4) == '124'

=begin
def solve(number, delete_n)
  string = number.to_s
  arr = string.chars
  cache = [] 
  
  (0..string.size).each do |idx|
    arr = string.chars
    
    delete_n.times do 
      arr.delete_at(idx)
      cache << arr.join
    end
  end
  
  int_arr = cache.map do |str_rep|
    str_rep.to_i
  end.min
  p int_arr.to_s
end
=end
