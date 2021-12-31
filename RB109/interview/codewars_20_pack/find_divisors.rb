=begin

i: int > 1    => arr of divisors        UNLESS input is prime => String phrase
                (not including input and 1)

tools : range object to iterate down to 2
      : some iterator
      : some array obj
      : some sort of selection method
DS:  str -> array

ALGO: 
GENERATE range object
TRAVERSE range object
SELECT num if input % num zero? 
if arr emtpy, string 
otherwise, return array

=end

def divisors(n)
  arr = (2...n).select{|divisor|(n % divisor).zero?}
  arr.empty? ? "#{n} is prime" : arr
end

# time to completion: 10 flat