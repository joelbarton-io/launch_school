=begin

Write a method that computes the difference between the square of the sum of the first n 
positive integers and the sum of the squares of the first n positive integers.


i: integer      o: sum of diff


ex: 
array starts at n -> 4
contains 4 numbers -> 4, 3, 2, 1 (NEVER include 0)

ds: array of digits

algo:
GENERATE array of digits from 1 upto n
CALCULATE product of squaring sum of elements [1, 2, 3] -> 6 ** 2

CALCULATE squares of elements, then get sum of that array [1, 2, 3] -> [1, 4, 9] -> 14
DIFF these values
=end



def sum_square_difference(n)
  numbers_arr = (1..n).each.with_object([]) {|number, arr| arr << number}
  numb_1 = numbers_arr.sum ** 2
  numb_2 = numbers_arr.map {|number| number ** 2}.sum
  numb_1 - numb_2
end
p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150