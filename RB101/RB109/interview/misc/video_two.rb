=begin
Goal: You have to create a method that takes a positive integer number and returns the next biggest number formed by the same digits.

i: integer
o: -1, or the NEXT largest integer formed from rearranging input's digits

keywords:
  -> "next": larger than our input number, but not the largest possible configuration
  -> ...permutation method? trying to avoid this one...

considerations:
-> input is always +integer
-> possible candidates will always be based on the digits that make up input value 45 -> 54

algo:
GUARD for ints of length 1 -> return -1, dont need to worry about negative values

GET all the permutations of input integer

IF ANY are greater than input, select those elements otherwise -> return -1

GET min from array of elements that are greater than input
=end

# def next_bigger_num(n)
#   return -1 if n.digits.size.eql?(1)
#   cache = []
#   n.digits.reverse.permutation {|perm| cache << perm.join.to_i}
#   cache = cache.select {|el| el > n}
#   cache.empty? ? -1 : cache.min  
# end


=begin
get max possible number -> sort digits, then join to int
iterate up to the largest possible number based on input
select only the numbers that include a the digits in the input
=end
def next_bigger_num(n)
  max_possible_value = n.digits.sort.join.to_i

  (n+1).upto(max_possible_value) do |num|
    return num if (n.digits - num.digits).eql?([])
  end
end


# p next_bigger_num(9) == -1
# p next_bigger_num(12) == 21
# p next_bigger_num(513) == 531
p next_bigger_num(2017) # == 2071
# p next_bigger_num(111) == -1
# p next_bigger_num(531) == -1
# p next_bigger_num(123456789) == 123456798