=begin
In this Kata, you will be given two integers n and k and your task is to remove k-digits from n and return the lowest number possible, without changing the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible number. The best digits to remove are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed 8 and 9.


input: 2 numbers n, k
output: 1 number (smallest possible after removing k digits from num n)

requirements:
- order does not change
- 

algorithm
- iterate k times
  -  at every iteration remove 1 digit to get the smallest possible number
  
- helper for removing 1 digit to get the smallest possible
  - iterate through each index
  - get the number without that character at that index
  - store these in array and return the smallest possible
=end

def remove_single(number)
  numbers = []
  
  number.to_s.size.times do |idx|
    num_arr = number.to_s.chars
    num_arr.delete_at(idx)
    numbers << num_arr.join
  end
  
  numbers.min
end

def solve(number, k)
  k.times do
    number = remove_single(number)
  end
  number.to_s
end


p solve(123056,1) == '12056'
p solve(123056,2) == '1056'
p solve(123056,3) == '056'
p solve(123056,4) == '05'
p solve(1284569,1) == '124569'
p solve(1284569,2) == '12456'
p solve(1284569,3) == '1245'
p solve(1284569,4) == '124'



def solve(phrase)
  phrase_chrs = phrase.chars.map(&:downcase)
  result = []
  tallies = phrase_chrs.tally

  phrase_chrs.each do |chr|
    result << ")" if tallies[chr] > 1
    result << "(" if tallies[chr] == 1
  end
  result.join
end
