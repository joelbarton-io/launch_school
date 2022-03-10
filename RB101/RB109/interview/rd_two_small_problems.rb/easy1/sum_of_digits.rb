=begin
i: int    o: sum of input's individual digits
ds: Int -> Str -> Arr -> elem as int -> sum -> end
Algo:
    - CONVERT input to str, then arr
    - SUM arr elements as ints
    - RETURN this int value
=end
def sum(number)
  number
    .to_s
    .chars
    .inject(0) {|acc, curr| acc + curr.to_i}  
end
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45