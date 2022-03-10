=begin
Given a List [] of n integers, find minimum number to be inserted in a list, 
so that sum of all elements of list should equal the closest prime number.

ASSUMPTIONS:
  -> input size is at least two in length
  -> array elements will always be positive
  -> array can have repeated elements
  -> The newer list's sum should equal the closest prime number.

Q:
what is a prime number?
  -> n > 1 with only two factors: self and 1

algo:
GET sum of input array
FIND shortest distance to a prime number from our sum value -> what ever this is, we return it

implementation:

INIT number = 0
Until our sum == a prime number 
  increment number by 1 
  add number to sum
end
return number

def minimum_number(numbers)
  #your code here
end

=end
# require 'prime'

# def minimum_number(numbers)
#   some = numbers.sum
#   minimum_diff = 0
#   until some.prime? do
#     minimum_diff += 1
#     some += 1
#   end
#   minimum_diff
# end

# sans Prime class
def minimum_number(numbers)
  init_sum = numbers.sum
  minimum_diff = 0
  until is_prime?(init_sum) do
    init_sum += 1
    minimum_diff += 1
  end
  minimum_diff
end

def is_prime?(curr_sum)
  (2...curr_sum).none? {|n| (curr_sum % n).zero? } # (2...curr_sum) -> excludes 1 and self
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2

