=begin




=end

def rotate_array(array)
  dup_arr = array.clone

  dup_arr.push(dup_arr.shift)
  dup_arr
end

def rotate_rightmost_digits(number, last_n)
  array = number.digits.reverse
  [[array[...-last_n]] + rotate_array(array.last(last_n))].flatten.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917