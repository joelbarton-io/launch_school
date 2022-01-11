=begin
i: input    -> maximum rotated input

need to rotate input-length - 1 times




=end
def max_rotation(input)
  n = input.to_s.size
  arr = input.digits.reverse
  result = []
  
  n.times do 
    arr << arr.shift
    result << arr.shift
  end
  result.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845